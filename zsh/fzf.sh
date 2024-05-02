#!/bin/zsh

export FZF_DEFAULT_COMMAND='fd --type file --hidden -E ".git" -E "node_modules" -E "target"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
