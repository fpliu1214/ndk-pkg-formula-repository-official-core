pkg_set summary "get system load averages"
pkg_set webpage "https://man7.org/linux/man-pages/man3/getloadavg.3.html"
pkg_set src.url "dir:///dev/null"

build() {
    cat > getloadavg.h <<EOF
#ifdef __cplusplus
    extern "C" {
#endif

        int getloadavg(double loadavg[], int nelem);

#ifdef __cplusplus
    }   
#endif
EOF

    # https://android.googlesource.com/platform/bionic/+/master/libc/include/stdlib.h#157
    # https://android.googlesource.com/platform/bionic/+/master/libc/bionic/getloadavg.cpp
    cat > getloadavg.c <<EOF
#include <stdlib.h>
#include <sys/sysinfo.h>

int getloadavg(double averages[], int n) {
    if (n < 0) return -1;
    if (n > 3) n = 3;
    struct sysinfo si;
    if (sysinfo(&si) == -1) return -1;
    for (int i = 0; i < n; ++i) {
        averages[i] = (double)(si.loads[i]) / (double)(1 << SI_LOAD_SHIFT);
    }
    return n;
}
EOF
    run $CC $CFLAGS $CPPFLAGS -c -o getloadavg.o getloadavg.c
    run $AR rsc libgetloadavg.a  getloadavg.o &&
    run install_incs getloadavg.h &&
    run install_libs libgetloadavg.a
}
