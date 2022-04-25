pkg_set summary "a small footprint HTTP Server with optional Lua and SQLite support written in C. It can be embedded into C/C++ applications or used as stand alone web server"
pkg_set git.url "https://github.com/civetweb/civetweb.git"
pkg_set src.url "https://github.com/civetweb/civetweb/archive/refs/tags/v1.15.tar.gz"
pkg_set src.sha "90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9"
pkg_set dep.pkg "zlib openssl lua"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DCIVETWEB_BUILD_TESTING=ON \
        -DCIVETWEB_ENABLE_SERVER_EXECUTABLE=ON \
        -DCIVETWEB_DISABLE_CGI=OFF \
        -DCIVETWEB_DISABLE_CACHING=OFF \
        -DCIVETWEB_ENABLE_CXX=ON \
        -DCIVETWEB_ENABLE_IPV6=ON \
        -DCIVETWEB_ENABLE_WEBSOCKETS=ON \
        -DCIVETWEB_ENABLE_SERVER_STATS=ON \
        -DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF \
        -DCIVETWEB_ENABLE_ASAN=ON \
        -DCIVETWEB_ENABLE_LUA=ON \
        -DCIVETWEB_ENABLE_ZLIB=ON \
        -DCIVETWEB_ENABLE_SSL=ON \
        -DCIVETWEB_SSL_OPENSSL_API_1_1=ON \
        -DCIVETWEB_ENABLE_LTO=ON \
        -DCIVETWEB_ENABLE_DEBUG_TOOLS=OFF \
        -DCIVETWEB_INSTALL_EXECUTABLE=ON \
        -DCIVETWEB_ALLOW_WARNINGS=OFF
}
