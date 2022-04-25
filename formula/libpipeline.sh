pkg_set summary "Library for manipulating pipelines of subprocesses in a flexible and convenient way"
pkg_set webpage "http://libpipeline.nongnu.org"
pkg_set src.url "http://download.savannah.nongnu.org/releases/libpipeline/libpipeline-1.5.5.tar.gz"
pkg_set src.sha "0c8367f8b82bb721b50647a647115b6e62a37e3b2e954a9685e4d933f30c00cc"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-threads=posix \
        --enable-socketpair-pipe
}
