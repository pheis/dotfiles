# zmodload zsh/zprof

# {{{ GPG
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye >/dev/null
# }}}


# Archlinux stuf TODO: guard with if uname
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi

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

# brew
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  # use gnu stuff over bsd stuff
  export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
fi


if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$HOME/Library/Python/3.9/bin:$PATH
fi

export EDITOR=nvim
# scripts
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/bin:$PATH"

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
# if [ $(uname -n) = "dipper" ] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#   start_sway
# fi
# }}}
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# NVM THIS IS VERY SLOW????
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

bindkey -e

export PATH="$HOME/.poetry/bin:$PATH"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
 eval "$(pyenv init --path)"

# Pyenv {{{
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
# }}}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pyry.heiskanen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pyry.heiskanen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pyry.heiskanen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pyry.heiskanen/google-cloud-sdk/completion.zsh.inc'; fi

# Dot net lol
# export DOTNET_ROOT=$HOME/.dotnet
# export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

# Starship propmpt
# eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"
# eval "$(direnv hook zsh)"
# eval $(thefuck --alias)
# zprof
[ -f "/Users/pyry.heiskanen/.ghcup/env" ] && source "/Users/pyry.heiskanen/.ghcup/env" # ghcup-env

exec fish
