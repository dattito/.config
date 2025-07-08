set -x STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

if type -q starship
  starship init fish | source
end
