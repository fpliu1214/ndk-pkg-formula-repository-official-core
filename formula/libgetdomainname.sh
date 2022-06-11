pkg_set summary "get NIS domain name"
pkg_set webpage "https://linux.die.net/man/2/getdomainname"
pkg_set src.url "dir:///dev/null"

build() {
    echo "int getdomainname(char *name, size_t len);" > getdomainname.h &&

    # https://android.googlesource.com/platform/bionic/+/master/libc/include/unistd.h#313
    # https://android.googlesource.com/platform/bionic/+/master/libc/bionic/getdomainname.cpp
    cat > getdomainname.c <<EOF
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <sys/utsname.h>

int getdomainname(char* name, size_t len) {
    struct utsname uts;
    if (uname(&uts) == -1) return -1;
    // Note: getdomainname()'s behavior varies across implementations when len is
    // too small.  bionic follows the historical libc policy of returning EINVAL,
    // instead of glibc's policy of copying the first len bytes without a NULL
    // terminator.
    if (strlen(uts.domainname) >= len) {
        errno = EINVAL;
        return -1;
    }
    strncpy(name, uts.domainname, len);
    return 0;
}
EOF
    run $CC $CFLAGS $CPPFLAGS -c -o getdomainname.o getdomainname.c
    run $CC $LDFLAGS -shared -o libgetdomainname.so getdomainname.o &&
    run $AR rsc libgetdomainname.a  getdomainname.o &&
    run install_incs getdomainname.h &&
    run install_libs libgetdomainname.a libgetdomainname.so
}
