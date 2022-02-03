#![feature(c_variadic)]
use std::sync::{RwLock, Arc};
use std::thread;
use std::{ffi::{CStr, CString}, os::raw::{c_char, c_int}};
pub use allo_isolate::store_dart_post_cobject;
use tokio::{runtime::Runtime};

mod lazy;

struct RustSDK {
    runtime: Runtime
}


__lazy_static_create!(RUST_SDK, RwLock<Option<Arc<RustSDK>>>);

fn get_rust_sdk() -> &'static RwLock<Option<Arc<RustSDK>>> {
    RUST_SDK.get(|| RwLock::new(None))
}


#[allow(non_camel_case_types)]
pub enum android_LogPriority {
    /** For internal use only.  */
    ANDROID_LOG_UNKNOWN = 0,
    /** The default priority, for internal use only.  */
    ANDROID_LOG_DEFAULT, /* only for SetMinPriority() */
    /** Verbose logging. Should typically be disabled for a release apk. */
    ANDROID_LOG_VERBOSE,
    /** Debug logging. Should typically be disabled for a release apk. */
    ANDROID_LOG_DEBUG,
    /** Informational logging. Should typically be disabled for a release apk. */
    ANDROID_LOG_INFO,
    /** Warning logging. For use with recoverable failures. */
    ANDROID_LOG_WARN,
    /** Error logging. For use with unrecoverable failures. */
    ANDROID_LOG_ERROR,
    /** Fatal logging. For use when aborting. */
    ANDROID_LOG_FATAL,
    /** For internal use only.  */
    ANDROID_LOG_SILENT, /* only for SetMinPriority(); must be last */
}


macro_rules! to_c_str {
    ($s: expr) => {
        CString::new($s).unwrap().as_ptr()
    };
}

#[link(name = "log", kind="dylib")]
extern "C" {
    fn __android_log_print(prio: i32, tag: *const c_char, fmt: *const c_char, ...) -> c_int;
}

macro_rules! host_print {
    ($tag: expr, $fmt: tt, $($arg:expr),*) => {
        unsafe { __android_log_print(android_LogPriority::ANDROID_LOG_INFO as _, to_c_str!($tag), to_c_str!($fmt), $(to_c_str!($arg)),*) }
    };
}


#[no_mangle]
pub extern "C" fn init_sdk(path: *mut c_char) -> i64 {
    let c_str: &CStr = unsafe { CStr::from_ptr(path) };
    let path = c_str.to_str().unwrap();
    *get_rust_sdk().write().unwrap() = Some(Arc::new(RustSDK {
        runtime: tokio::runtime::Builder::new_multi_thread()
            .thread_name("rust-rt")
            .enable_all()
            .on_thread_start(move || {
                host_print!("rust", "%s thread started", thread::current().name().unwrap());
            })
            .on_thread_stop(move || {
                host_print!("rust", "%s thread stopping", thread::current().name().unwrap());
            })
            .build()
            .unwrap()
    }));
    host_print!("rust", "init_sdk(path=\"%s\")", path);
    0
}

#[no_mangle]
pub extern "C" fn set_stream_port(port: i64) -> i32 {
    let r = get_rust_sdk().read().unwrap().as_ref().unwrap().clone();
    host_print!("rust", "set_stream_port(port=%s)", port.to_string());
    r.runtime.spawn(Box::pin(async move {
        post_to_flutter(vec![1,0,2,4], port).await;
    }));
    0
}

async fn post_to_flutter(response: Vec<u8>, port: i64) {
    let isolate = allo_isolate::Isolate::new(port);
    match isolate.catch_unwind(async {
        response
    }).await {
        Ok(_) => {
            host_print!("rust", "%s", "[FFI]: Post data to dart success");
        }
        Err(e) => {
            if let Some(&msg) = e.downcast_ref::<&str>() {
                host_print!("rust", "[FFI]: %s", msg);
            } else {
                host_print!("rust", "%s", "[FFI]: allo_isolate post panic");
            }
        }
    }
}