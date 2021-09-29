# rbenv
set PATH $HOME/.rbenv/shims $PATH
status --is-interactive; and source (rbenv init -|psub)

# Aliases
alias be="bundle exec"

# vertica `vsql`
# set -x LANG en_US.UTF-8
# set PATH /opt/vertica/bin $PATH

# golang
set PATH /usr/local/go/bin $PATH
set PATH ~/go/bin $PATH

# rust
set PATH ~/.cargo/bin $PATH

# reset mouse accel
# defaults write .GlobalPreferences com.apple.mouse.scaling 1

# node
# nvm use default

# sigh
# set -x JAVA_HOME /usr/bin/java

set -x EDITOR vim

eval (direnv hook fish)

starship init fish | source
