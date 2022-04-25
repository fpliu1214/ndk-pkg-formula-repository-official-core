pkg_set summary "Seamless operability between C++11 and Python"
pkg_set git.url "https://github.com/pybind/pybind11.git"
pkg_set src.url "https://github.com/pybind/pybind11/archive/v2.9.2.tar.gz"
pkg_set src.sha "6bd528c4dbe2276635dc787b6b1f2e5316cf6b49ee3e150264e455a0d68d19c1"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DPYBIND11_TEST=OFF \
        -DPYBIND11_INSTALL=ON \
        -DPYBIND11_NOPYTHON=ON \
        -DCMAKE_INSTALL_DATAROOTDIR="$TARGET_INSTALL_DIR/lib"
}
