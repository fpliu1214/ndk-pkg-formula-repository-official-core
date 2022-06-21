pkg_set summary "get number of bytes in a character"
pkg_set webpage "https://pubs.opengroup.org/onlinepubs/9699919799/functions/mblen.html"
pkg_set src.url "dir:///dev/null"

build() {
    cat > mblen.h <<EOF
#ifdef __cplusplus
    extern "C" {
#endif

        int mblen(const char* s, size_t n);

#ifdef __cplusplus
    }   
#endif
EOF

    cat > mblen.c <<EOF
#include <stdlib.h>
#include <wchar.h>

int mblen(const char* s, size_t n) {
    mbstate_t state = {};
    return mbrlen(s, n, &state);
}
EOF
    run $CC $CFLAGS $CPPFLAGS -c -o mblen.o mblen.c
    run $AR rsc libmblen.a  mblen.o &&
    run install_incs mblen.h &&
    run install_libs libmblen.a
}
