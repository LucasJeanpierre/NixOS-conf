{ pkgs, ... }: {
  home.stateVersion = "25.11";


  home.packages = with pkgs; [
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };


  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs = {
    kitty.enable = true;
    starship.enable = true;
    neovim.enable = true;
  };

  gtk.enable = true;

}