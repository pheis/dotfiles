{ pkgs, overlays, ... }: {
  nixpkgs.overlays = overlays;

  environment.systemPackages = with pkgs; [
    colmena
    nixfmt-classic
    git
    neovim
    nil
    shellcheck
    sequoia-sq
    neofetch
    gnused
    pgcli
    gh
    go
    cargo-tarpaulin
    aerc
    passage
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
      "koekeishiya/homebrew-formulae" # yabai skhd
      "FelixKratz/formulae" # sketchybar
      "shaunsingh/SFMono-Nerd-Font-Ligaturized"
    ];

    brews = [
      "fswatch"
      "openssl@3" # required for native openssl stuff
      "tokei"
      "gh"
      "hurl"
      "libpq"
      "dbmate"
      "sketchybar"
      "ncspot"
      "htop"
      "yubikey-personalization"
      "ykman"
      "pinentry-mac"
      "wget"
      "lazygit"
      "yabai"
      "skhd"
      "jq"
      "deno"
      "node"
      "fd"
      "magic-wormhole"
      "bat"
      "eza"
      "sd"
      "fish"
      "fnm"
      "fzf"
      "ripgrep"
      "starship"
      "stow"
      "tmux"
      "zoxide"
      "thefuck"
      "direnv"
      "pyenv"
      "gnupg"
      "lima"
      "colima"
      "atuin"
      "yarn"
      "arp-scan"
      "difftastic"
      "glow"
      "azure-cli"
      "tenv"
      "pnpm"
      "stylua"
      "borders"
      "sqlcmd"
      "zig"
      "ghcup"
      "zls"
      "tectonic"
      "tree-sitter"
      "pandoc"
      "lua-language-server"
      "openconnect"
      "uv"
      "age"
      "age-plugin-yubikey"
      "aichat"
      "oath-toolkit"
      "ansible"
    ];

    casks = [
      "alacritty"
      "google-chrome"
      "firefox"
      "font-fira-mono-nerd-font"
      "whatsapp"
      "telegram"
      "karabiner-elements"
      "porting-kit"
      "element"
      "kitty"
      "wezterm"
      "zed"
      "slack"
      "font-sf-mono-nerd-font-ligaturized"
      "docker"
      "steam"
      "visual-studio-code"
      "sioyek"
      "vmware-fusion"
      "ollama"
    ];
  };
}
