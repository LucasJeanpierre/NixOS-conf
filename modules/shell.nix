{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    kitty
    bat
    eza
    htop
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;
  };

  environment.shellAliases = {
    ls = "eza --icons --group-directories-first";
    ll = "eza -la --icons --group-directories-first";
    cat = "bat --style=auto";
    nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-conf#nixos";
    nix-update = "nix flake update ~/nixos-conf && nix-switch";
    nix-clean = "sudo nix-collect-garbage -d";
  };
}
