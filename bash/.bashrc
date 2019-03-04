#
# ~/.bashrc
#

source ~/.cargo/env

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=/usr/local/bin:$PATH
export ANSIBLE_ROLES_PATH=$HOME/debian-ansible/roles
# export PASSWORD_STORE_DIR=$HOME/ylitse-secrets

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

alias g='git'
alias com='git commit -m'
alias gco='git co'
alias gdm='git diff master'
alias gd='git diff'
alias gs='git status'
alias go='git co'

alias m='python3 ~/code/m/m.py'

alias ls='ls -G'

alias ypass='PASSWORD_STORE_DIR=$HOME/ylitse-secrets pass'

# git init --bare $HOME/.myconfig
# alias c='git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
# cconfig status.showUntrackedFiles no

alias t='tmux'

alias npm-exec='PATH=$(npm bin):$PATH'

# alias ls='ls --color=auto'
alias v='nvim'
alias p='python3'
# PS1='[\u@\h \W]\$ '

export EDITOR=nvim

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/android/sdk

export PATH=$(pyenv root):$PATH
export PATH=~/bin:$PATH
export PATH=/opt/android-sdk/:$PATH
export PATH=/opt/android-sdk/emulator:$PATH

NPM_PACKAGES="${HOME}/.npm-pkgs"

PATH="$NPM_PACKAGES/bin:$PATH"
# PATH="$~/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

stty -ixon
