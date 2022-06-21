pkg_set summary "User-friendly command-line shell for UNIX-like operating systems"
pkg_set webpage "https://fishshell.com"
pkg_set git.url "https://github.com/fish-shell/fish-shell.git"
pkg_set src.url "https://github.com/fish-shell/fish-shell/releases/download/3.5.0/fish-3.5.0.tar.xz"
pkg_set src.sha "291e4ec7c6c3fea54dc1aed057ce3d42b356fa6f70865627b2c7dfcecaefd210"
pkg_set license "GPL-2.0-or-later"
pkg_set dep.pkg "pcre2 readline"
pkg_set bsystem "cmake"

# int posix_spawn(pid_t* __pid, const char* __path, const posix_spawn_file_actions_t* __actions, const posix_spawnattr_t* __attr, char* const __argv[], char* const __env[]) __INTRODUCED_IN(28);
pkg_set sdk.api 28

build() {
    cmakew -DWITH_GETTEXT=OFF
}
