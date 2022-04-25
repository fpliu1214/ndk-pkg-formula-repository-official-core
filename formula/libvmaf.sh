pkg_set summary "Perceptual video quality assessment based on multi-method fusion"
pkg_set git.url "https://github.com/Netflix/vmaf.git"
pkg_set src.url "https://github.com/Netflix/vmaf/archive/v2.3.1.tar.gz"
pkg_set src.sha "8d60b1ddab043ada25ff11ced821da6e0c37fd7730dd81c24f1fc12be7293ef2"
pkg_set license "BSD-2-Clause-Patent"
pkg_set dep.cmd "nasm"
pkg_set bsystem "meson"
pkg_set bscript "libvmaf"

build() {
    mesonw \
        -Denable_tests=false \
        -Denable_docs=false \
        -Denable_asm=true
}
