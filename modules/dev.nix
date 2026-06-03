{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vscode
    python3
    git
    gh
    gcc
    neovim
  ];
}
