pkg_set summary "Speex audio processing library"
pkg_set git.url "https://github.com/xiph/speexdsp.git"
pkg_set src.url "https://github.com/xiph/speexdsp/archive/SpeexDSP-1.2.0.tar.gz"
pkg_set src.sha "d7032f607e8913c019b190c2bccc36ea73fc36718ee38b5cdfc4e4c0a04ce9a4"
pkg_set license "BSD-3-Clause;COPYING;https://raw.githubusercontent.com/xiph/speexdsp/master/COPYING"
pkg_set dep.cmd "glibtoolize:libtoolize"
pkg_set bsystem "autogen"
pkg_set ldflags "-lm"
