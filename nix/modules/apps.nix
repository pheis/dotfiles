{ pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    git
    neovim
    nil
    shellcheck
    sequoia-sq
    neofetch
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
    ];

    brews = [
      "htop"
      "yubikey-personalization"
      "ykman"
      "pinentry-mac"
      "wget"
      "lazygit"
      "yabai"
      "skhd"
      "docker"
      "docker-compose"
      "docker-ls"
      "docker-buildx"
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
      "amethyst"
      "alacritty"
      "google-chrome"
      "firefox"
      "font-fira-mono-nerd-font"
      "whatsapp"
      "telegram"
      "slack"
      "karabiner-elements"
      "porting-kit"
      "element"
    ];
  };
}
