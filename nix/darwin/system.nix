{ ... }:

###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{

  system = {
    primaryUser = "pyry";

    stateVersion = 5;

    defaults = {
      dock.autohide = true;
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      NSGlobalDomain._HIHideMenuBar = true;
      NSGlobalDomain."com.apple.keyboard.fnState" = true;

      # other macOS's defaults configuration.
      # ......
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;

}
