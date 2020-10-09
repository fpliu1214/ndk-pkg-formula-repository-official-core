summary="C library for the arithmetic of high precision complex numbers"
homepage="http://www.multiprecision.org/mpc"
url="https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz"
sha256="6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
dependencies="gmp mpfr"

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-gmp="$gmp_DIR_INSTALL_PREFIX" \
        --with-mpfr="$mpfr_DIR_INSTALL_PREFIX" \
        --disable-valgrind-tests \
        --disable-logging \
        --enable-static \
        --enable-shared \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    make clean &&
    make install
}
