#!/bin/zsh

if [[ -x "$(command -v zellij)" ]]; then
  function zr () { zellij run --name "$*" -- zsh -ic "$*";}
  function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
  function ze () { zellij edit "$*";}
  function zef () { zellij edit --floating "$*";}

  if [ "$NO_ITERM" != "1" ]; then
    # ZSH_TMUX_AUTOSTART=true
    eval "$(zellij setup --generate-auto-start zsh)"
  fi
fi
