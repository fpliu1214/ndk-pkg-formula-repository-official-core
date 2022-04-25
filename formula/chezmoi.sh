pkg_set summary "Manage your dotfiles across multiple diverse machines, securely"
pkg_set webpage "https://chezmoi.io/"
pkg_set git.url "https://github.com/twpayne/chezmoi.git"
pkg_set src.url "https://github.com/twpayne/chezmoi/archive/refs/tags/v2.15.1.tar.gz"
pkg_set src.sha "0100dcf8b70774595f56859e5d1b635319ba584ad7b280946352be328f36d679"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    gow \
        -X main.version=$PACKAGE_VERSION \
        -X main.commit=$PACKAGE_GIT_REV \
        -X main.date=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
        -X main.builtBy=ndk-pkg
}
