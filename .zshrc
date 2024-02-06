export PATH=$PATH:$HOME/bin:/opt/homebrew/bin
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'


plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

eval "$(starship init zsh)"

alias vim='nvim'
alias ll='ls -alh'

disappointed() { echo -n " ಠ_ಠ " |tee /dev/tty| xclip -selection clipboard; }

flip() { echo -n "（╯°□°）╯ ┻━┻" |tee /dev/tty| xclip -selection clipboard; }

shrug() { echo -n "¯\_(ツ)_/¯" |tee /dev/tty| xclip -selection clipboard; }

matrix() { echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4;        letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}' }

git_clean_branches() {
  local base_branch=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')

  # Switch to the base branch
  git switch $base_branch

  # Fetch all branches from the remote repository
  git fetch -p

  # Get a list of local branches
  local -a local_branches=($(git branch --format='%(refname:lstrip=-1)' --list))

  # Get a list of remote branches
  local -a remote_branches=($(git branch -r --format='%(refname:lstrip=-1)' --list))

  # Iterate over local branches
  for local_branch in "${local_branches[@]}"
  do
    # Check if the local branch exists on the remote
    if [[ ! " ${remote_branches[@]} " =~ " ${local_branch} " ]]; then
      # If it doesn't, delete the local branch
      git branch -D $local_branch
      echo "Deleted local branch: $local_branch"
    fi
  done
}


