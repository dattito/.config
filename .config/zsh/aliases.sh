#!/bin/zsh

alias vim=nvim
alias cd=z
alias cat=bat
alias vz="vim ~/.zshrc"
alias vo="vim +Oil"
alias g="git"
alias gs="git status"
alias lg="lazygit"
alias ld="lazydocker"
alias b="fbi"
alias vn="z dotfiles && v"
alias t="tree -I node_modules -I .git -a"
alias lc="latexmk -pdf -dvi- -shell-escape -output-directory=output"
alias lw="watchexec -i \"output/**\" 'latexmk -pdf -dvi- -shell-escape -output-directory=output'"
alias zf="zellij run -f --"
alias zfc="zellij run -f -c --"
alias ci="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias cn="cd ~/repositories/dotfiles"

alias ls='eza --color=always --group-directories-first --icons'
alias lss='eza --color=always --group-directories-first --icons --total-size'
alias l='eza -la --icons --octal-permissions --group-directories-first'
alias lls='eza -la --icons --octal-permissions --group-directories-first --total-size'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons' 
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'

alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E '^\.'"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias k=kubectl
alias ka="kubectl apply"
alias kaf="kubectl apply -f"
alias kd="kubectl delete"
alias kdf="kubectl delete -f"

# Use corepack for node package managers
alias yarn="corepack yarn"
alias yarnpkg="corepack yarnpkg"
alias pnpm="corepack pnpm"
alias pnpx="corepack pnpx"
alias npm="corepack npm"
alias npx="corepack npx"

# find and replace in all files
alias sda="fd --type file --exec sd"

# Generate duck.com e-mail and store in the clipboard
alias new-duck-email="duck-gen|pbcopy"

function vy() {
  cd "$1" && vim +Oil
}

function v() {
   file=$(fzf --preview='bat --color=always --style=numbers {}' --height 50% --reverse --style minimal); [ -f "$file" ] && vim $file || true
}

function load_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

function cv() {
  zi
  v
}

function bu() {
  zrf brew upgrade
}

function take() {
    mkdir -p "$argv[1]" && cd "$argv[1]"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
