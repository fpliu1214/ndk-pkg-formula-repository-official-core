pkg_set summary "GNU version of the tar archiving utility"
pkg_set webpage "https://www.gnu.org/software/tar"
pkg_set git.url "https://git.savannah.gnu.org/git/tar.git"
pkg_set src.url "https://ftp.gnu.org/gnu/tar/tar-1.34.tar.gz"
pkg_set src.sha "03d908cf5768cfe6b7ad588c921c6ed21acabfb2b79b788d1330453507647aed"
pkg_set license "GPL-3.0-or-later"
pkg_set dep.pkg "libglob"
pkg_set bsystem "configure"

# no member named '_p' in 'struct __sFILE'
#  return fp->_p - fp->_bf._base;
pkg_set sdk.api 24

build() {
    export CPPFLAGS="$CPPFLAGS -D__USE_FORTIFY_LEVEL=0 -D__POSIX_VISIBLE=199209 -D__BSD_VISIBLE"

    # int glob(const char* __pattern, int __flags, int (*__error_callback)(const char* __failure_path, int __failure_errno), glob_t* __result_ptr) __INTRODUCED_IN(28);
    # void globfree(glob_t* __result_ptr) __INTRODUCED_IN(28);
    if [ "$TARGET_OS_VERS" -lt 28 ] ; then
        LIBS="$libglob_LIBRARY_DIR/libglob.a"
    fi

    configure \
        --with-included-regex \
        --with-xattrs \
        --without-posix-acls \
        --without-selinux \
        --disable-acl \
        --disable-gcc-warnings \
        LIBS=$LIBS
}
