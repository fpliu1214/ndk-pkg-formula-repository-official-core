pkg_set summary "C library for zip/unzip via zLib"
pkg_set webpage "https://www.winimage.com/zLibDll/minizip.html"
pkg_set src.url "https://zlib.net/zlib-1.2.12.tar.gz"
pkg_set src.sha "91844808532e5ce316b3c010929493c0244f3d37593afd6de04f71821d5136d9"
pkg_set license "Zlib"
pkg_set dep.cmd "glibtoolize:libtoolize"
pkg_set bsystem "autotools"
pkg_set bscript "contrib/minizip"
