#!/bin/zsh

alias vim=nvim
alias cd=z
alias cat=bat
alias v="fzf |xargs nvim"
alias vz="vim ~/.zshrc"
alias t="tree -I node_modules -I .git -a"
alias lc="latexmk -pdf -dvi- -shell-escape -output-directory=output"
alias lw="watchexec -i \"output/**\" 'latexmk -pdf -dvi- -shell-escape -output-directory=output'"
alias k=kubectl
alias zf="zellij run -f --"
alias zfc="zellij run -f -c --"

alias ls='eza --color=always --group-directories-first --icons'
alias l='eza -la --icons --octal-permissions --group-directories-first'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons' 
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'

alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E '^\.'"
alias ..="cd .."

function vy() {
  cd "$1" && vim +Oil
}

function load_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}
