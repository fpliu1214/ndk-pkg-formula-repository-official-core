package set summary "Small static webserver without CGI"
package set webpage "https://unix4lyfe.org/darkhttpd/"
package set src.git "https://github.com/emikulic/darkhttpd.git"
package set src.url "https://github.com/emikulic/darkhttpd/archive/v1.13.tar.gz"
package set src.sum "1d88c395ac79ca9365aa5af71afe4ad136a4ed45099ca398168d4a2014dc0fc2"
package set license "ISC"

build() {
    run $CC $CPPFLAGS $CFLAGS $LDFLAGS -o "darkhttpd $SOURCE_DIR/darkhttpd.c" &&
    install_bins darkhttpd
}
