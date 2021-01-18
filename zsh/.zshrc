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
alias t='tmux'
alias ls='ls -G'
alias v='nvim'
alias g='git'
# }}}

# Prevent Ctrl-S
stty -ixon
