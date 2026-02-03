if (( $+commands[cargo] )); then
	# This is not generated on nixos 2025-10-09
  # . "$HOME/.cargo/env"
fi

if (( $+commands[brew] )); then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi


if (( $+commands[poetry] )); then
  export PATH="/Users/pyry/.local/bin:$PATH"
fi

export PATH="$HOME/scripts:$PATH"
