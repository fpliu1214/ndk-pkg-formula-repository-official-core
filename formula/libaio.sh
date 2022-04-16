package set summary "Linux-native asynchronous I/O access library"
package set webpage "https://pagure.io/libaio"
package set src.url "https://pagure.io/libaio/archive/libaio-0.3.113/libaio-libaio-0.3.113.tar.gz"
package set src.sum "716c7059703247344eb066b54ecbc3ca2134f0103307192e6c2b7dab5f9528ab"
package set license "LGPL-2.1-or-later"
package set bsystem "make"
package set binbstd "yes"

prepare() {
    # on macOS, some fs is non-case-sensitive. In this case, makew install will always say make: 'install' is up to date.
    mv INSTALL INSTALL.txt &&
    sed_in_place 's|install -D|install|g' src/Makefile
}

build() {
    makew clean &&
    makew default CFLAGS="'$CFLAGS $CPPFLAGS $LDFLAGS -I$PACKAGE_BSCRIPT_DIR/src'" AR="$AR" RANLIB="$RANLIB" &&
    install -d "$TARGET_INSTALL_DIR/include" &&
    install -d "$TARGET_INSTALL_DIR/lib" &&
    makew install prefix="$TARGET_INSTALL_DIR"
}
