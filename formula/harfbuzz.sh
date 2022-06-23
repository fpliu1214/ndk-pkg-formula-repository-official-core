pkg_set summary "OpenType text shaping engine"
pkg_set git.url "https://github.com/harfbuzz/harfbuzz.git"
pkg_set src.url "https://github.com/harfbuzz/harfbuzz/archive/4.3.0.tar.gz"
pkg_set src.sha "32184860ddc0b264ff95010e1c64e596bd746fe4c2e34014a1185340cdddeba6"
pkg_set license "MIT"
pkg_set dep.pkg "icu4c glib graphite2"
pkg_set bsystem "meson"

build() {
    mesonw \
        -Dicu=enabled \
        -Dglib=enabled \
        -Dcairo=disabled \
        -Dfreetype=enabled \
        -Dgraphite=disabled \
        -Dgraphite2=enabled \
        -Dgobject=disabled \
        -Dintrospection=disabled \
        -Ddocs=disabled \
        -Dtests=disabled \
        -Dbenchmark=disabled
}
