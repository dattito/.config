#!/bin/zsh

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

if [[ -x "$(command -v zoxide)" ]]; then
  eval "$(starship init zsh)"
fi
