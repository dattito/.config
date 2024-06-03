#!/bin/zsh

if [[ -x "$(command -v zoxide)" ]]; then
  eval "$(zoxide init zsh)"
  alias c="zi"
fi
