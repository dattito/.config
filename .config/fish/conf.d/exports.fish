function espsetup
  set -gx LIBCLANG_PATH /Users/I568850/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-19.1.2_20250225/esp-clang/lib
end

set -gx EDITOR nvim
set -gx K9S_CONFIG_DIR ~/.config/k9s

set -gx BAT_THEME "Catppuccin Mocha"

set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
