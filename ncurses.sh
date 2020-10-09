summary="Text-based UI library"
homepage="https://www.gnu.org/software/ncurses"
url="https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz"
sha256="30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d"

build() {
    ./configure \
        --build=$(./config.guess) \
        --host="$TARGET_HOST" \
        --target="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --without-pkg-config \
        --without-tests \
        --without-ada \
        --without-debug \
        --without-valgrind \
        --with-shared \
        --enable-largefile \
        --enable-warnings \
        --enable-pc-files \
        --with-pkg-config-libdir="$DIR_INSTALL_PREFIX/lib/pkgconfig" \
        --enable-stripping \
        --disable-assertions \
        --disable-gnat-projects \
        --disable-echo \
        --disable-rpath \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \ 
        CXXFLAGS="$CXXFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
    make clean &&
    make install &&
    (install_links)
}

install_links() {
    cd "$DIR_INSTALL_PREFIX/include" || return 1
    for item in curses.h form.h ncurses.h panel.h term.h termcap.h
    do
        ln -s "ncurses/$item" "$item" || return 1
    done
}
