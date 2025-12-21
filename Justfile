stow:
  stow --target ~/ . -d .
  git config --global core.excludesFile '~/.config/git/.gitignore'

uk: # update karabiner
  cp ~/.config/karabiner/karabiner.json ./.config/karabiner/karabiner.json
