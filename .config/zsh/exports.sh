#!/bin/zsh

# export RUSTC_WRAPPER=sccache
export EDITOR="nvim"
export PATH="$HOME/go/bin:$PATH"
export BAT_THEME="Catppuccin Mocha"

# for image.nvim
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"

export COREPACK_HOME="$HOME/.cache/node/corepack"

export PATH="/opt/homebrew/opt/ruby/bin:$HOME/.bun/bin:$PATH"

export FPATH="$HOME/.docker/completions:$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"

export XDG_CONFIG_HOME=$HOME/.config

function export_env_vars() {
    # Allow optional path to .env file, default to .env in current directory
    local env_file="${1:-.env}"

    # Check if the specified .env file exists
    if [[ ! -f "$env_file" ]]; then
        echo "Error: .env file not found at '$env_file'."
        return 1
    fi

    # Read the .env file line by line
    while IFS='=' read -r key value || [[ -n "$key" ]]; do
        # Ignore lines starting with '#' (comments) or blank lines
        if [[ $key =~ ^#.*$ || -z $key ]]; then
            continue
        fi

        # Trim surrounding whitespace (if any) from key and value
        key=$(echo "$key" | xargs)
        value=$(echo "$value" | xargs)

        # Export the variable to the environment
        export "$key=$value"
    done < "$env_file"

    echo "Environment variables from '$env_file' have been exported."
}

alias e="export_env_vars"
