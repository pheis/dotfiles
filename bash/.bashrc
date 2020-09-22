#
# ~/.bashrc
#

# source ~/.cargo/env

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PATH=$HOME/.poetry/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=/usr/local/bin:$PATH
export ANSIBLE_ROLES_PATH=$HOME/debian-ansible/roles
# export PASSWORD_STORE_DIR=$HOME/ylitse-secrets




# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



# FZF
export FZF_DEFAULT_COMMAND='fd --type f'

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi


export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Git
if [ -f $HOME/.git-completion.bash ]; then
  . $HOME/.git-completion.bash
fi

# Bash commandline coloring
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
DARKGREEN="\[\033[0;32m\]"
GREEN="\[\033[1;32m\]"
NO_COLOR="\[\033[0m\]"
LIGHT_CYAN="\[\e[96m\]"
LIGHT_MAGENTA="\[\e[35m\]"

# PS1="$NO_COLOR[\t] $YELLOW\$(parse_git_branch) $DARKGREEN\u@\h:$LIGHT_MAGENTA\w $NO_COLOR\$ "
PS1="$YELLOW\$(parse_git_branch) $LIGHT_MAGENTA\w $NO_COLOR\$ "

# shopt -s globstar
# fbr() {
#   local branches branch
#   branches=$(git --no-pager branch -vv --sort=-committerdate) &&
#   branch=$(echo "$branches" | fzf +m) &&
#   git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
# }
# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

alias g='git'
alias com='git commit -m'
alias gco='git co'
alias gdm='git diff master'
alias gd='git diff'
alias gs='git status'

alias ls='ls -G'

if [ "$OSTYPE" == "linux-gnu" ]; then
    alias ls='ls --color'
fi

alias ypass='PASSWORD_STORE_DIR=$HOME/ylitse-secrets pass'

eval "$(pyenv init -)"

# git init --bare $HOME/.myconfig
# alias c='git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
# cconfig status.showUntrackedFiles no

alias t='tmux'

alias npm-exec='PATH=$(npm bin):$PATH'

# alias ls='ls --color=auto'
alias p='python3'
# PS1='[\u@\h \W]\$ '

export EDITOR=nvim
alias v='nvim'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
    export ANDROID_HOME=$HOME/Library/android/sdk
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
    export ANDROID_HOME=$HOME/Library/android/sdk
fi

export npm_config_prefix=~/.node_modules

export PATH=$HOME/.node_modules/bin:$PATH
export PATH=$(pyenv root):$PATH
export PATH=~/script:$PATH
export PATH=~/bin:$PATH
export PATH=/opt/android-sdk/:$PATH
export PATH=/opt/android-sdk/emulator:$PATH

stty -ixon

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# eval "$(starship init bash)"
