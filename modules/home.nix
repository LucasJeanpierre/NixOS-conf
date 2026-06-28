{ pkgs, ... }: {
  home.stateVersion = "26.05";
  home.username      = "zeta";
  home.homeDirectory = "/home/zeta";

  home.packages = with pkgs; [
    gnome-tweaks
    dconf-editor

    gnomeExtensions.user-themes    
    gnomeExtensions.just-perfection   
    gnomeExtensions.dash-to-panel     
    gnomeExtensions.space-bar

    catppuccin-cursors.mochaMauve
    nerd-fonts.jetbrains-mono
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/background" = {
        picture-uri-dark = "file:///home/zeta/nixos-conf/assets/dark-cat.png";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "just-perfection-desktop@just-perfection"
          # "space-bar@luchrioh"
        ];
        favorite-apps = [
          "firefox.desktop"
          "kitty.desktop"
        ];
      };

      "org/gnome/shell/extensions/blur-my-shell" = {
        blur = true;
        brightness = 0.5;
        noise-amount = 0;
      };

      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        brightness = 0.5;
        noise-amount = 0;
        static-blur = true;
        style-panel = 2;
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        edge-tiling = true;
      };

      "org/gnome/desktop/input-sources" = {
        sources = [
          [ "xkb" "us+intl" ]
        ];
      };

    };
  };


  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  programs = {
    starship.enable = true;
    neovim.enable = true;
    btop.enable = true;
    bat.enable = true;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name    = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
  };

  programs.kitty = {
    enable = true;

    font.name = "JetBrainsMono Nerd Font";
    font.size = 13;

    settings = {
      background_opacity = "0.85";
      dynamic_background_color = true;

      window_padding_width = 16;
      window_padding_height = 12;

      hide_window_decorations = "yes";

      cursor_shape = "beam";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = 0;
    };
  };

}