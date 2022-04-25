pkg_set summary "Utilities for the ext2, ext3, and ext4 file systems"
pkg_set webpage "https://e2fsprogs.sourceforge.io/"
pkg_set git.url "https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
pkg_set src.url "https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.45.6/e2fsprogs-1.45.6.tar.gz"
pkg_set src.sha "5f64ac50a2b60b8e67c5b382bb137dec39344017103caffc3a61554424f2d693"
pkg_set license "GPL-2.0-or-later"
pkg_set dep.cmd "pkg-config"
pkg_set dep.pkg "gettext libiconv"

# mntent.h: char* hasmntopt(const struct mntent* __entry, const char* __option) __INTRODUCED_IN(26);

build() {
    configure \
        --with-libiconv-prefix="$libiconv_INSTALL_DIR" \
        --with-libintl-prefix="$gettext_INSTALL_DIR"
}
