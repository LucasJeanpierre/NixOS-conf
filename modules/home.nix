{ pkgs, ... }: {
  home.stateVersion = "26.05";
  home.username      = "zeta";
  home.homeDirectory = "/home/zeta";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  xdg.configFile."cosmic/com.system76.CosmicBackground/v1/all".text = ''
    (
      output: "all",
      source: Path("/home/zeta/nixos-conf/assets/peaceful_mountain.png"),
      filter_by_theme: true,
      rotation_frequency: 300,
      filter_method: Lanczos,
      scaling_mode: Zoom,
      sampling_method: Alphanumeric,
    )
  '';

  xdg.configFile."cosmic/com.system76.CosmicTerm/v1/font_name".text = ''
    "JetBrainsMono Nerd Font Mono"
  '';

  xdg.configFile."cosmic/com.system76.CosmicTerm/v1/show_headerbar".text = ''
    false
  '';

  xdg.configFile."cosmic/com.system76.CosmicTheme.Mode/v1/is_dark".text = ''
    true
  '';

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

}
