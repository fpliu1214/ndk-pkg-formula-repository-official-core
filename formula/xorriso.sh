pkg_set summary "ISO9660+RR manipulation tool"
pkg_set webpage "https://www.gnu.org/software/xorriso"
pkg_set src.url "https://ftp.gnu.org/gnu/xorriso/xorriso-1.5.4.tar.gz"
pkg_set src.sha "3ac155f0ca53e8dbeefacc7f32205a98f4f27d2d348de39ee0183ba8a4c9e392"
pkg_set license "GPL-2.0-or-later"
pkg_set dep.pkg "libiconv liblanginfo"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-libacl \
        --enable-xattr \
        --enable-zlib \
        --enable-libbz2 \
        --enable-libcdio \
        --enable-jtethreads
}
