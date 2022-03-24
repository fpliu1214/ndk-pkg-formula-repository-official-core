package set summary "Highly capable, feature-rich programming language"
package set webpage "https://www.perl.org"
package set git.url "https://github.com/perl/perl5.git"

package set src.url "https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz"
package set src.sum "82c2e5e5c71b0e10487a80d79140469ab1f8056349ca8545140a224dbbed7ded"

# http://arsv.github.io/perl-cross/index.html
package set fix.url "https://github.com/arsv/perl-cross/releases/download/1.3.6/perl-cross-1.3.6.tar.gz"
package set fix.sum "4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5"

package set license "GPL-1.0-or-later"
package set dep.cmd "cc ar nm ranlib readelf"
package set bsystem "make"

build() {
    TARGET_CC=$CC
    TARGET_CXX=$CXX
    TARGET_CPP=$CPP
    TARGET_AS=$AS
    TARGET_LD=$LD
    TARGET_AR=$AR
    TARGET_RANLIB=$RANLIB

    TARGET_CFLAGS=$CFLAGS
    TARGET_CXXFLAGS=$CXXFLAGS
    TARGET_CPPFLAGS=$CPPFLAGS
    TARGET_LDFLAGS=$LDFLAGS

    unset CC
    unset CXX
    unset CPP
    unset AS
    unset LD
    unset AR
    unset RANLIB

    unset CFLAGS
    unset CXXFLAGS
    unset CPPFLAGS
    unset LDFLAGS

    run tar --strip-components=1 -xf "$PACKAGE_SRC_PATH" &&
    run tar --strip-components=1 -xf "$PACKAGE_FIX_PATH" &&
    ./configure \
        --target="$TARGET_TRIPLE" \
        -Dosname=android \
		-Dsysroot=$SYSROOT \
		-Dprefix=$TARGET_INSTALL_DIR \
		-Dcc="$TARGET_CC" \
        -Dld="$TARGET_CC -Wl,--enable-new-dtags" \
		-Dar="$TARGET_AR" \
		-Dranlib="$TARGET_RANLIB" \
        -Duseshrplib \
        -Dusethreads &&
    makew clean &&
    makew &&
    makew install &&
    run ln -sr "$TARGET_INSTALL_DIR/lib/perl5/$PACKAGE_VERSION/$TARGET_OS_ARCH-android/CORE/libperl.so" "$TARGET_INSTALL_DIR/lib/libperl.so" &&
    run install -d "$TARGET_INSTALL_DIR/include" &&
    run ln -sr "$TARGET_INSTALL_DIR/lib/perl5/$PACKAGE_VERSION/$TARGET_OS_ARCH-android/CORE" "$TARGET_INSTALL_DIR/include/perl"
}
