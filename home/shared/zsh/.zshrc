# zmodload zsh/zprof
# brew
if [[ $(uname) == "Darwin" ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  # use gnu stuff over bsd stuff
  export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
fi


export XDG_CONFIG_HOME="$HOME/.config"

# {{{ GPG
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye >/dev/null
# }}}


# {{{ Aliases
alias ls='exa'
alias g='git'
alias gs='git status'
alias p='python'
alias t='tmux'
alias v='nvim'
alias lg='g l | head -20'
alias gr='git rev-list --all | xargs git grep'
alias cdgr='cd $(git rev-parse --show-toplevel)'
# }}}

# Prevent Ctrl-S, Dunno if needed with zsh?
stty -ixon

alias ypass='PASSWORD_STORE_DIR=$HOME/ylitse-secrets pass'


# zsh things
# autoload -Uz compinit
# compinit
# setopt COMPLETE_ALIASES

export EDITOR=nvim
# scripts
export PATH="$HOME/scripts:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# poetry  {{{
# curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
export PATH="$PATH:$HOME/.poetry/bin"
# }}}
#
# yarn globals
# export PATH="$PATH:$(yarn global bin)"

# Java, Android
if [[ "$OSTYPE" == "darwin"* ]]; then
    # export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
    # export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home
    # RN recommends zulu11?
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
    export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
    export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
    # export ANDROID_HOME=$HOME/Library/android/sdk
fi


bindkey -e



export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[ -f "/Users/pyry.heiskanen/.ghcup/env" ] && source "/Users/pyry.heiskanen/.ghcup/env" # ghcup-env

exec fish

source /Users/pyry/.config/broot/launcher/bash/br
