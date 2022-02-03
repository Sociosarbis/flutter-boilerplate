use std::{cell::Cell, sync::Once};
use std::hint::unreachable_unchecked;

pub struct Lazy<T: Sync>(Cell<Option<T>>, Once);

impl <T: Sync> Lazy<T> {
    pub const INIT: Self = Lazy(Cell::new(None), Once::new());

    pub fn get<F>(&'static self, f: F) -> &T
    where
        F: FnOnce() -> T
    {
        self.1.call_once(|| {
            self.0.set(Some(f()));
        });
        unsafe {
            match *self.0.as_ptr() {
                Some(ref x) => x,
                None => {
                    unreachable_unchecked()
                }
            }
        }
    }
}

unsafe impl<T: Sync> Sync for Lazy<T>{}

#[macro_export]
macro_rules! __lazy_static_create {
    ($NAME: ident, $T: ty) => {
        static $NAME: $crate::lazy::Lazy<$T> = $crate::lazy::Lazy::INIT;
    };
}