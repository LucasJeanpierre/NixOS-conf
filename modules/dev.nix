{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vscode
    python3
    go
    rustup
    git
    gcc
    neovim
  ];
}
