#!/bin/zsh

export FZF_DEFAULT_COMMAND='fd --type file --hidden -E ".git" -E "{node_modules,target,.venv,.git,__pycache__,dist,build,.terraform}"'

export FZF_DEFAULT_OPTS=" \
--color=spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#bac2de,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#bac2de,hl+:#f38ba8"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fzf --zsh)"
