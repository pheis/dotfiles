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
      # yabai, skhd
      "koekeishiya/homebrew-formulae"
      # bar
      "FelixKratz/formulae"
    ];

    brews = [
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
      "docker-ls"
      "docker-buildx"
      "docker-compose"
      "jq"
      "deno"
      "node"
      "fd"
      "magic-wormhole"
      "bat"
      "eza"
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
      "docker"
      "vmware-fusion"
      "zed"
    ];
  };
}
