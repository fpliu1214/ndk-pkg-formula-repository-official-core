pkg_set summary "Modern shell for the GitHub era"
pkg_set webpage "https://www.nushell.sh"
pkg_set git.url "https://github.com/nushell/nushell.git"
pkg_set src.url "https://github.com/nushell/nushell/archive/0.64.0.tar.gz"
pkg_set src.sha "7adcc49bca0748dba680a2e118e158faae7bc14fb2e32b0056866d356b48d879"
pkg_set license "MIT"
pkg_set dep.pkg "openssl"
pkg_set dep.cmd "pkg-config"
pkg_set bsystem "cargo"
pkg_set binbstd "yes"

# int getgrgid_r(gid_t __gid, struct group* __group, char* __buf, size_t __n, struct group** __result) __INTRODUCED_IN(24);
pkg_set sdk.api 24

base64_decode() {
    base64 -d <<EOF
LS0tIGEvY3JhdGVzL251LXBhdGgvc3JjL3RpbGRlLnJzCisrKyBiL2NyYXRlcy9udS1wYXRoL3Ny
Yy90aWxkZS5ycwpAQCAtNTMsNiArNTMsMTIgQEAKICAgICAvLyBSZXR1cm5zIGhvbWUgZGlyIG9m
IHVzZXIuCiB9CiAKKyNbY2ZnKHRhcmdldF9vcyA9ICJhbmRyb2lkIildCisjW2FsbG93KHVudXNl
ZCldCitmbiB1c2VyX2hvbWVfZGlyKHVzZXJuYW1lOiAmc3RyKSAtPiBQYXRoQnVmIHsKKyAgICBQ
YXRoQnVmOjpmcm9tKFN0cmluZzo6ZnJvbSgiQFRFUk1VWF9IT01FQCIpKQorfQorCiAjW2NmZyh0
YXJnZXRfb3MgPSAibWFjb3MiKV0KIGZuIHVzZXJfaG9tZV9kaXIodXNlcm5hbWU6ICZzdHIpIC0+
IFBhdGhCdWYgewogICAgIG1hdGNoIGRpcnNfbmV4dDo6aG9tZV9kaXIoKSB7Cg==
EOF
}

prepare() {
    base64_decode | patch -p1
}
