pkg_set summary "H.265/HEVC encoder"
pkg_set webpage "http://x265.org"
pkg_set git.url "https://bitbucket.org/multicoreware/x265_git.git"
pkg_set src.url "https://bitbucket.org/multicoreware/x265_git/get/3.5.tar.gz"
pkg_set src.sha "5ca3403c08de4716719575ec56c686b1eb55b078c0fe50a064dcf1ac20af1618"
pkg_set license "GPL-2.0-only;COPYING;https://bitbucket.org/multicoreware/x265_git/raw/9b59d45549f460e41a852cfd276f9b89eed2112a/COPYING"
pkg_set bsystem "cmake"
pkg_set bscript "source"

prepare() {
    sed_in_place 's/list(APPEND PLATFORM_LIBS pthread)//g' CMakeLists.txt
}

build() {
    cmakew \
        -DENABLE_PIC=ON \
        -DENABLE_CLI=ON \
        -DENABLE_SHARED=ON \
        -DENABLE_ASSEMBLY=OFF
}
