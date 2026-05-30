{ pkgs, ... }: {
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    catppuccin-kvantum
    catppuccin-kde
  ];

  catppuccin = {
    flavor = "mocha";
  };

  programs.plasma = {
    enable = true;
  };
}