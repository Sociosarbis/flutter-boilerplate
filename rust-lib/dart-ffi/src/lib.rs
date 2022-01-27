#![feature(c_variadic)]
use std::{ffi::{CStr, CString}, os::raw::{c_char, c_int}};
pub use allo_isolate::store_dart_post_cobject;


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
    host_print!("rust", "init_sdk(path=\"%s\")", path);
    0
}

#[no_mangle]
pub extern "C" fn set_stream_port(port: i64) -> i32 {
    host_print!("rust", "set_stream_port(port=%s)", port.to_string());
    0
}