package set summary "Secure FTP server for UNIX"
package set webpage "https://security.appspot.com/vsftpd.html"
package set src.url "https://security.appspot.com/downloads/vsftpd-3.0.5.tar.gz"
package set src.sum "26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3"
package set license "GPL-2.0-only"
package set dep.pkg "openssl libcap libcrypt"
package set bsystem "make"
package set binbstd 'yes'

prepare() {
    # https://linux.die.net/man/3/getusershell
    sed_in_place '/#define VSF_SYSDEP_HAVE_USERSHELL/d' sysdeputil.c
}

build() {
    makew clean &&
    makew CC="$CC" CFLAGS="'$CFLAGS $CPPFLAGS'" LDFLAGS="'$LDFLAGS'" LIBS="'-lssl -lcrypto -lcrypt -lcap'" &&
    install_bins vsftpd
}
