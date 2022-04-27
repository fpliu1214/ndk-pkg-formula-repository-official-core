pkg_set summary "Library for interacting with JSON"
pkg_set git.url "https://github.com/open-source-parsers/jsoncpp.git"
pkg_set src.url "https://github.com/open-source-parsers/jsoncpp/archive/1.9.5.tar.gz"
pkg_set src.sha "f409856e5920c18d0c2fb85276e24ee607d2a09b5e7d5f0a371368903c275da2"
pkg_set license "MIT;LICENSE;https://raw.githubusercontent.com/open-source-parsers/jsoncpp/master/LICENSE"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DJSONCPP_WITH_EXAMPLE=OFF \
        -DJSONCPP_WITH_TESTS=OFF \
        -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
        -DJSONCPP_WITH_WARNING_AS_ERROR=OFF \
        -DJSONCPP_WITH_PKGCONFIG_SUPPORT=ON \
        -DJSONCPP_WITH_CMAKE_PACKAGE=ON \
        -DJSONCPP_USE_SECURE_MEMORY=ON \
        -DJSONCPP_WITH_STRICT_ISO=ON
}
