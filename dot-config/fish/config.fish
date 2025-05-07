# reset mouse accel
# defaults write .GlobalPreferences com.apple.mouse.scaling 1

set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES
set -x EDITOR nvim
set -p PATH $HOME/bin $ASDF_DATA_DIR/shims /run/current-system/sw/bin

if uname -s | string match -q "Darwin"
	set -p PATH /opt/homebrew/bin
end

alias vim "nvim"
alias ll "eza -alh"
alias lt "eza -alhT"
alias ls "eza -a"

eval (direnv hook fish)

starship init fish | source

source ~/.asdf/asdf.fish

