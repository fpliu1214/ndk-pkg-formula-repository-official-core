package set summary "Experimental Rust compiler front-end for IDEs"
package set webpage "https://rust-analyzer.github.io/"
package set git.url "https://github.com/rust-analyzer/rust-analyzer.git"
package set version "2022-03-14"
package set src.url "https://github.com/rust-analyzer/rust-analyzer/archive/refs/tags/$PACKAGE_VERSION.tar.gz"
package set src.sum "d86d39f28b20791320b78dd67f7ddbb98580628e931cdb823e493240cc493216"
package set license "Apache-2.0"
package set bscript "crates/rust-analyzer"
package set bsystem "cargo"

build() {
    cargow install --locked
}
