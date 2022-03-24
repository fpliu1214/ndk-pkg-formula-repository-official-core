package set summary "Extremely fast non-cryptographic hash algorithm"
package set git.url "https://github.com/Cyan4973/xxHash.git"
package set src.url "https://github.com/Cyan4973/xxHash/archive/v0.8.1.tar.gz"
package set src.sum "3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c"
package set license "BSD-2-Clause"
package set bsystem "make"
package set binbstd "yes"

build() {
    makew clean   UNAME=Linux &&
    makew install UNAME=Linux PREFIX="$TARGET_INSTALL_DIR" CC="$CC" CFLAGS="'$CFLAGS'" CPPFLAGS="'$CPPFLAGS'" LDFLAGS="'$LDFLAGS -shared'" AR="$AR" V=1
}
