#!/bin/zsh

zstyle ':antidote:bundle' file "$HOME/.config/antidote/plugins.txt"
zstyle ':antidote:static' file "$HOME/.config/antidote/plugins.zsh"
source "/opt/homebrew/opt/antidote/share/antidote/antidote.zsh"
antidote load

bindkey '^ ' autosuggest-accept
