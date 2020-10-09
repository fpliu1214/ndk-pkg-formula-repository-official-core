summary="LZMA-based compression program similar to gzip or bzip2"
homepage="https://www.nongnu.org/lzip"
url="https://download-mirror.savannah.gnu.org/releases/lzip/lzip-1.21.tar.gz"
sha256="e48b5039d3164d670791f9c5dbaa832bf2df080cb1fbb4f33aa7b3300b670d8b"
license="GPL-2.0"

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    make clean &&
    make install
}
