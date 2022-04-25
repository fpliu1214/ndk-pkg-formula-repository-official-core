pkg_set summary "a POSIX-compliant implementation of /bin/sh that aims to be as small as possible"
pkg_set webpage "http://gondor.apana.org.au/~herbert/dash"
pkg_set git.url "https://git.kernel.org/pub/scm/utils/dash/dash.git"
pkg_set src.url "http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.5.tar.gz"
pkg_set src.sha "db778110891f7937985f29bf23410fe1c5d669502760f584e54e0e7b29e123bd"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "configure"
pkg_set dep.pkg "libedit libglob"

build() {
    # char* strchrnul(char* __s, int __ch) __RENAME(strchrnul) __attribute_pure__ __INTRODUCED_IN(24);
    if [ "$TARGET_OS_VERS" -lt 24 ] ; then
        ac_cv_func_strchrnul=no
    else
        ac_cv_func_strchrnul=yes
    fi

    # int glob(const char* __pattern, int __flags, int (*__error_callback)(const char* __failure_path, int __failure_errno), glob_t* __result_ptr) __INTRODUCED_IN(28);
    if [ "$TARGET_OS_VERS" -lt 28 ] ; then
        export LDFLAGS="$LDFLAGS $libglob_LIBRARY_DIR/libglob.a"
    fi

    configure \
        --with-libedit="$libedit_INSTALL_DIR" \
        --enable-test-workaround=no \
        --enable-fnmatch \
        --enable-lineno \
        --enable-glob \
        --enable-static=no \
        ac_cv_func_faccessat=no \
        ac_cv_func_sigsetmask=no \
        ac_cv_func_strchrnul=$ac_cv_func_strchrnul
}
