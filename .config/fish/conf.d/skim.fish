set -gx SKIM_DEFAULT_COMMAND 'fd --type file --hidden -E ".git" -E "{node_modules,target,.venv,.git,__pycache__,dist,build,.terraform,.mypy_cache,.ipynb_checkpoints,.DS_Store,.ruff_cache,.idea}"'

set -gx SKIM_DEFAULT_OPTIONS --color=bw,matched:#f38ba8,current_match:#f38ba8,current_match_bg:237
