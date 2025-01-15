#!/bin/zsh

if [[ -x "$(command -v zellij)" ]]; then

  export ZELLIJ_AUTO_ATTACH="true"
  eval "$(zellij setup --generate-auto-start zsh)"
  # export ZELLIJ_AUTO_EXIT="true"

  function zr () { zellij run --name "$*" -- zsh -ic "$*";}
  function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
  function ze () { zellij edit "$*";}
  function zef () { zellij edit --floating "$*";}

  if [ "$NO_MULTIPLEXER" != "1" ]; then
    eval "$(zellij setup --generate-auto-start zsh)"
  fi
fi
