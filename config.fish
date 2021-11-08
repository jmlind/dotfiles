# rbenv
status --is-interactive; and rbenv init - fish | source

# Aliases
alias be="bundle exec"

# reset mouse accel
# defaults write .GlobalPreferences com.apple.mouse.scaling 1

# when node gets too annoying
# nvm use default

# sigh
# set -x JAVA_HOME /usr/bin/java

set -x EDITOR vim

eval (direnv hook fish)

starship init fish | source
