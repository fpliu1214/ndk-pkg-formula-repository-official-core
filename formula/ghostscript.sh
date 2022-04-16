package set summary "Interpreter for PostScript and PDF"
package set webpage "https://www.ghostscript.com/"
package set src.url "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9561/ghostpdl-9.56.1.tar.xz"
package set src.sum "05e64c19853e475290fd608a415289dc21892c4d08ee9086138284b6addcb299"
package set license "AGPL-3.0-or-later"
package set dep.pkg "fontconfig jbig2dec libidn lcms2 openjpeg tesseract"
package set dep.cmd "pkg-config"
package set bsystem "configure"
package set binbstd "yes"

prepare() {
    rm -rf expat
    rm -rf freetype
    rm -rf jbig2dec
    rm -rf jpeg
    rm -rf lcms2mt
    rm -rf libpng
    rm -rf openjpeg
    rm -rf tiff
    rm -rf zlib
    rm -rf tesseract
    sed_in_place 's|-lpthread||g' configure
    sed_in_place 's|nl_langinfo(CODESET)|"UTF-8"|' contrib/opvp/gdevopvp.c
}

build() {
    run ln -s "$PKG_CONFIG" "$TARGET_TRIPLE-pkg-config" || return 1
    export PATH="$PWD:$PATH"
    export CPPFLAGS="$CPPFLAGS -I$freetype2_with_harfbuzz_INCLUDE_DIR/freetype2"
    export ac_cv_lib_pthread_pthread_create=yes
    configure \
        --disable-compile-inits \
        --disable-cups \
        --disable-gtk \
        --with-system-libtiff \
        --without-x &&
    run make soclean &&
    run make install-so
}
