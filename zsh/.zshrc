# {{{ Start sway on login with linux laptop
if [ $(uname -n) = "dipper" ] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
# }}}

# {{{ GPG
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
# }}}

# Starship propmpt
eval "$(starship init zsh)"


# {{{ Aliases
alias ls='exa'
alias g='git'
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
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# scripts
export PATH="$HOME/scripts:$PATH"

# poetry  {{{
# curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
export PATH="$PATH:$HOME/.local/bin"
# }}}
#
# yarn globals
export PATH="$PATH:$(yarn global bin)"

# Pyenv {{{
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# }}}

# Java, Android
if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
    export ANDROID_HOME=$HOME/Library/android/sdk
fi

