#!/bin/zsh

export RUSTC_WRAPPER=sccache
export EDITOR="nvim"
export PATH="$HOME/go/bin:$PATH"
export BAT_THEME="Catppuccin Mocha"

# for image.nvim
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"

export COREPACK_HOME="$HOME/.cache/node/corepack"

echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
