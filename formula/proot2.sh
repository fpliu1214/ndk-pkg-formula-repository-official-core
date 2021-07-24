package set summary "a user-space implementation of chroot, mount --bind, and binfmt_misc."
package set webpage "https://proot-me.github.io"
package set src.git "https://github.com/proot-me/proot.git"
package set version "5.1.107"
package set src.url "https://github.com/termux/proot/archive/8f67d6c7fadb445b7a528020d05e72dba717c5b9.zip"
package set src.sum "a5d248d307766bb807a35ee88d90456c0d1e0791cecffe5fb5d40d203be663ac"
package set license "GPL-2.0"
package set dep.cmd "git base64 patch python3:python3.9:python3.8:python3.7:python3.6:python>=3.6"
package set dep.pkg "talloc"
package set bsystem "make"
package set binsrcd 'true'
package set sourced "proot-$(basename "$PACKAGE_SRC_URL" .zip)/src"
package set sdk.api 23

prepare() {
    printf "LS0tIEdOVW1ha2VmaWxlLmJhawkyMDIxLTA3LTAzIDE2OjI4OjU2LjAwMDAwMDAwMCArMDgwMAorKysgR05VbWFrZWZpbGUJMjAyMS0wNy0wMyAxNjozMzowMC4wMDAwMDAwMDAgKzA4MDAKQEAgLTE0LDkgKzE0LDkgQEAKIE9CSkNPUFkgID89ICQoQ1JPU1NfQ09NUElMRSlvYmpjb3B5CiBPQkpEVU1QICA/PSAkKENST1NTX0NPTVBJTEUpb2JqZHVtcAogCi1DUFBGTEFHUyArPSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0dOVV9TT1VSQ0UgLUkuIC1JJChWUEFUSCkKLUNGTEFHUyAgICs9IC1XYWxsIC1XZXh0cmEgLU8yCi1MREZMQUdTICArPSAtbHRhbGxvYyAtV2wsLXosbm9leGVjc3RhY2sKK292ZXJyaWRlIENQUEZMQUdTICs9IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfR05VX1NPVVJDRSAtSS4gLUkkKFZQQVRIKQorb3ZlcnJpZGUgQ0ZMQUdTICAgKz0gLVdhbGwgLVdleHRyYSAtTzIKK292ZXJyaWRlIExERkxBR1MgICs9IC1sdGFsbG9jIC1XbCwteixub2V4ZWNzdGFjawogCiBPQkpFQ1RTICs9IFwKIAljbGkvY2xpLm8JCVwKQEAgLTI1NSw3ICsyNTUsOCBAQAogCS0kKFJNKSAtZiAkKENIRUNLX09CSkVDVFMpICQoQ0hFQ0tfUFJPR1JBTVMpICQoQ0hFQ0tfUkVTVUxUUykgJChPQkpFQ1RTKSAkKExPQURFUl9PQkpFQ1RTKSAkKExPQURFUi1tMzJfT0JKRUNUUykgcHJvb3QgbG9hZGVyL2xvYWRlciBsb2FkZXIvbG9hZGVyLW0zMiAkKERFUFMpIGJ1aWxkLmggbGljZW5zZXMKIAogaW5zdGFsbDogcHJvb3QKLQkkKCQocXVpZXQpSU5TVEFMTCkgLUQgJDwgJChERVNURElSKSQoQklORElSKS8kPAorCSQoSU5TVEFMTCkgLWQgJChERVNURElSKSQoQklORElSKQorCSQoSU5TVEFMTCkgJDwgJChERVNURElSKSQoQklORElSKS8kPAogaWZkZWYgUFJPT1RfVU5CVU5ETEVfTE9BREVSCiAJJChJTlNUQUxMKSAtRCBsb2FkZXIvbG9hZGVyICQoUFJPT1RfVU5CVU5ETEVfTE9BREVSKS9sb2FkZXIKIGlmZGVmIEhBU19MT0FERVJfMzJCSVQK" | base64 -d | patch &&
    sed_in_place 's|-ltalloc||' GNUmakefile
}

build() {
    makew clean &&
    makew V=1 CC=$CC LD=$CC STRIP=$STRIP OBJCOPY=$OBJCOPY OBJDUMP=$OBJDUMP CPPFLAGS="'$CPPFLAGS'" CFLAGS="'$CFLAGS'" LDFLAGS="'$LDFLAGS $talloc_LIBRARY_DIR/libtalloc.a'" &&
    makew install PREFIX=$ABI_INSTALL_DIR DESTDIR=
}
