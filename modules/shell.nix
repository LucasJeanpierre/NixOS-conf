{ pkgs, ... }: {
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
    nix-switch = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nix-update = "pushd /etc/nixos && nix flake update && nix-switch && popd";
  };
}
