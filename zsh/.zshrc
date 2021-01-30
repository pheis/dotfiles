
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
# }}}

# Prevent Ctrl-S, Dunno if needed with zsh?
stty -ixon

if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
    export ANDROID_HOME=$HOME/Library/android/sdk
fi

alias ypass='PASSWORD_STORE_DIR=$HOME/ylitse-secrets pass'


# zsh things
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# scriptit
export PATH="$HOME/scripts:$PATH"

# curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
# poetry
export PATH="$HOME/.poetry/bin:$PATH"
