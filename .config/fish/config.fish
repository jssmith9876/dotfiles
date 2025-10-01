# Add global npm modules to our path
set PATH /Users/jordan.smith.2/.nvm/versions/node/v16.15.0/bin $PATH

# Initialize pyenv
pyenv init - fish | source

# Set default editor
set EDITOR "nvim"

set RUST_BACKTRACE 1

# Set our AWS_PROFILE to DEV
set -x AWS_PROFILE DEV

# Configure prompt colors
set --global hydro_color_pwd cyan
set --global hydro_color_git white
set --global hydro_color_duration green


eval "$(fnm env --use-on-cd --shell fish | source)"

# Clear any output to get a blank terminal
clear
 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/jordan.smith.2/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


# Created by `pipx` on 2025-03-10 16:50:03
set PATH $PATH /Users/jordan.smith.2/.local/bin
