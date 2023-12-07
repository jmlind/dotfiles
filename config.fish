# reset mouse accel
# defaults write .GlobalPreferences com.apple.mouse.scaling 1

set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES
set -x EDITOR nvim

alias vim "nvim $argv"

eval (direnv hook fish)

starship init fish | source

source ~/.asdf/asdf.fish
