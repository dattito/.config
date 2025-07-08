alias vim nvim
alias cd z
alias cat bat
alias vz "vim ~/.config/fish/config.fish"
alias vo "vim +Oil"
alias g git
alias gs "git status"
alias lg lazygit
alias ld lazydocker
alias b fbi
alias vn "z dotfiles; and v"
alias t "tree -I node_modules -I .git -a"
alias lc "latexmk -pdf -dvi- -shell-escape -output-directory=output"
alias lw "watchexec -i 'output/**' 'latexmk -pdf -dvi- -shell-escape -output-directory=output'"
alias zf "zellij run -f --"
alias zfc "zellij run -f -c --"
alias ci "cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias cn "cd ~/repositories/dotfiles"

alias ls "eza --color=always --group-directories-first --icons"
alias lss "eza --color=always --group-directories-first --icons --total-size"
alias l "eza -la --icons --octal-permissions --group-directories-first"
alias lls "eza -la --icons --octal-permissions --group-directories-first --total-size"
alias llm "eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons"
alias la "eza --long --all --group --group-directories-first"
alias lx "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons"

alias lS "eza -1 --color=always --group-directories-first --icons"
alias lt "eza --tree --level=2 --color=always --group-directories-first --icons"
alias l. "eza -a | grep -E '^\.'"

alias k kubectl
alias ka "kubectl apply"
alias kaf "kubectl apply -f"
alias kd "kubectl delete"
alias kdf "kubectl delete -f"

alias yarn "corepack yarn"
alias yarnpkg "corepack yarnpkg"
alias pnpm "corepack pnpm"
alias pnpx "corepack pnpx"
alias npm "corepack npm"
alias npx "corepack npx"

alias sda "fd --type file --exec sd"

alias new-duck-email "duck-gen|pbcopy"

function vy
  cd "$argv[1]"; and vim +Oil
end

function v
  set file (fzf --preview='bat --color=always --style=numbers {}' --height 50% --reverse --style minimal)
  test -f "$file"; and vim "$file"; or true
end

function load_nvm
  set -x NVM_DIR "$HOME/.nvm"
  # Note: NVM's `nvm.sh` is written for bash/zsh. Sourcing it directly in Fish
  # might lead to issues or not work as expected. Consider using a Fish-specific
  # NVM solution (e.g., `nvm.fish` or `bass` for sourcing bash scripts).
  test -s "/opt/homebrew/opt/nvm/nvm.sh"; and source "/opt/homebrew/opt/nvm/nvm.sh"
  test -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"; and source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
end

function cv
  zi
  v
end

function bu
  zrf brew upgrade
end

function take
  mkdir -p "$argv[1]"; and cd "$argv[1]"
end

function y
  set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
  set -l cwd
  yazi "$argv" --cwd-file="$tmp"
  if set cwd (command cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
    builtin cd -- "$cwd"
  end
  rm -f -- "$tmp"
end
