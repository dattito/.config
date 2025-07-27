# --- Pre-requisite Checks ---
if not command -q brew
    echo "brew command not found: please install via https://brew.sh/"
    return
end

if not command -q sk
    echo "sk command not found: please install via 'brew install sk'"
    return
end


# --- sk Configuration Variables ---
set -g FB_FORMULA_PREVIEW 'HOMEBREW_COLOR=true brew info {}'
set -g FB_FORMULA_BIND "ctrl-space:execute-silent(brew home {})"
set -g FB_CASK_PREVIEW 'HOMEBREW_COLOR=true brew info --cask {}'
set -g FB_CASK_BIND "ctrl-space:execute-silent(brew home --cask {})"


# --- Standalone Helper Functions ---

# Fuzzy Brew Install (formulae)
function fbi --description "Fuzzy find and install brew formulae"
    set -l inst (brew formulae | sk --query=$argv[1] -m --preview $FB_FORMULA_PREVIEW --bind $FB_FORMULA_BIND)

    if test -n "$inst"
        for prog in $inst
            brew install $prog
        end
    end
end

# Fuzzy Brew Uninstall (formulae)
function fbui --description "Fuzzy find and uninstall brew formulae"
    set -l uninst (brew leaves | sk --query=$argv[1] -m --preview $FB_FORMULA_PREVIEW --bind $FB_FORMULA_BIND)

    if test -n "$uninst"
        for prog in $uninst
            brew uninstall $prog
        end
    end
end

# Fuzzy Cask Install
function fci --description "Fuzzy find and install brew casks"
    set -l inst (brew casks | sk --query=$argv[1] -m --preview $FB_CASK_PREVIEW --bind $FB_CASK_BIND)

    if test -n "$inst"
        for prog in $inst
            brew install --cask $prog
        end
    end
end

# Fuzzy Cask Uninstall
function fcui --description "Fuzzy find and uninstall brew casks"
    set -l inst (brew list --cask | sk --query=$argv[1] -m --preview $FB_CASK_PREVIEW --bind $FB_CASK_BIND)

    if test -n "$inst"
        for prog in $inst
            brew uninstall --cask $prog
        end
    end
end


# --- Tab Completion Logic ---

# Condition: true if the command is `brew install` but NOT `brew install --cask`
function __fish_brew_needs_formula_to_install
    set -l cmd (commandline -opc)
    # Ensure at least 'brew install' is typed
    if count $cmd -lt 2; return 1; end # FIX: Removed [ ] for numeric comparison
    # Check for 'brew install' and that '--cask' is NOT present
    if $cmd[1] = "brew" and $cmd[2] = "install" and not contains -- "--cask" $cmd # FIX: Removed [ ] for string comparisons
        return 0
    end
    return 1
end

# Condition: true if the command is `brew uninstall` but NOT `brew uninstall --cask`
function __fish_brew_needs_formula_to_uninstall
    set -l cmd (commandline -opc)
    if count $cmd -lt 2; return 1; end # FIX: Removed [ ]
    if $cmd[1] = "brew" and $cmd[2] = "uninstall" and not contains -- "--cask" $cmd # FIX: Removed [ ]
        return 0
    end
    return 1
end

# Condition: true if the command is `brew install --cask`
function __fish_brew_needs_cask_to_install
    set -l cmd (commandline -opc)
    if count $cmd -lt 2; return 1; end # FIX: Removed [ ]
    if $cmd[1] = "brew" and $cmd[2] = "install" and contains -- "--cask" $cmd # FIX: Removed [ ]
        return 0
    end
    return 1
end

# Condition: true if the command is `brew uninstall --cask`
function __fish_brew_needs_cask_to_uninstall
    set -l cmd (commandline -opc)
    if count $cmd -lt 2; return 1; end # FIX: Removed [ ]
    if $cmd[1] = "brew" and $cmd[2] = "uninstall" and contains -- "--cask" $cmd # FIX: Removed [ ]
        return 0
    end
    return 1
end
# --- Register Completions ---
# These will trigger sk on Tab if the conditions above are met.

# `brew install <TAB>`
complete -c brew -n '__fish_brew_needs_formula_to_install' -a "(brew formulae | sk -m --preview $FB_FORMULA_PREVIEW --bind $FB_FORMULA_BIND)" --no-files

# `brew uninstall <TAB>`
complete -c brew -n '__fish_brew_needs_formula_to_uninstall' -a "(brew leaves | sk -m --preview $FB_FORMULA_PREVIEW --bind $FB_FORMULA_BIND)" --no-files

# `brew install --cask <TAB>`
complete -c brew -n '__fish_brew_needs_cask_to_install' -a "(brew casks | sk -m --preview $FB_CASK_PREVIEW --bind $FB_CASK_BIND)" --no-files

# `brew uninstall --cask <TAB>`
complete -c brew -n '__fish_brew_needs_cask_to_uninstall' -a "(brew list --cask | sk -m --preview $FB_CASK_PREVIEW --bind $FB_CASK_BIND)" --no-files
