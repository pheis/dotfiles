{ pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    git
    neovim
    nil
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
      # "koekeishiya/homebrew-formulae"
    ];

    brews = [
      # "yabai"
      # "skhd"
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
      "colima"
      "atuin"
      "yarn"
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
      "portingkit"
      "element"
    ];
  };
}
