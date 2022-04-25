pkg_set summary "crypt(3) implementation"
pkg_set webpage "http://michael.dipperstein.com/crypt"
pkg_set src.url "http://michael.dipperstein.com/crypt/crypt3.c"
pkg_set src.sha "75b16b6ef7f1c0c7c4172ed346b2b91b6f1be72c824b6671a059de2b2da554ff"
pkg_set version "1"

build() {
    cat > libconfstr.c <<EOF
#include<stdlib.h>
size_t confstr(int name, char *buf, size_t len) {
    return 0;
}
EOF
    run $CC $CFLAGS $CPPFLAGS -c -o libconfstr.o libconfstr.c &&
    run $AR rsc libconfstr.a libconfstr.o &&
    run install_libs libconfstr.a
}
