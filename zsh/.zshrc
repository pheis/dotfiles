
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

# Archlinux stuf TODO: guard with if uname
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

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

function go_wl() {
  # export DISPLAY=":0.0"
  # export WAYLAND_DISPLAY=wayland-0
  export XDG_RUNTIME_DIR=/run/user/1000
  export SDL_VIDEODRIVER=wayland
  export QT_QPA_PLATFORM=wayland
  #export ELM_DISPLAY=wl export ECORE_EVAS_ENGINE=wayland_egl
  #export ELM_ENGINE=wayland_egl
  #export ELM_ACCEL=opengl
  export GDK_BACKEND=wayland
  #unset GDK_BACKEND
  #export DBUS_SESSION_BUS_ADDRESS
  #export DBUS_SESSION_BUS_PID
  export MOZ_ENABLE_WAYLAND=1
  #unset WAYLAND_DISPLAY
  export XDG_CURRENT_DESKTOP=sway
  export XDG_SESSION_TYPE=wayland
}

function start_sway() {
  go_wl
  exec sway
}

# {{{ Start sway on login with linux laptop
if [ $(uname -n) = "dipper" ] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  start_sway
fi
# }}}
