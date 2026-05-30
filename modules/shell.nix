{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    kitty
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
  };

  programs.starship = {
    enable = true;
  };


  environment.shellAliases = {
    nix-switch = "sudo nixos-rebuild switch --flake $HOME/nixos-conf#nixos";
    nix-update = "pushd $HOME/nixos-conf && sudo nix flake update && popd";
    nix-edit = "code $HOME/nixos-conf";
  };
}
