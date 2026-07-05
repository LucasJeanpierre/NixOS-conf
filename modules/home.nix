{ pkgs, ... }: {
  home.stateVersion = "26.05";
  home.username      = "zeta";
  home.homeDirectory = "/home/zeta";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];


  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sky";
  };

  programs = {
    starship.enable = true;
    neovim.enable = true;
    btop.enable = true;
    bat.enable = true;
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