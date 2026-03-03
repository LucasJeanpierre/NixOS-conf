# NixOS-conf
NixOS configuration

## Install
```Shell
git clone https://github.com/LucasJeanpierre/NixOS-conf.git ~/nixos-conf
cp nixos-conf
cp /etc/nixos/hardware-configuration.nix ~/nixos-conf && git add hardware-configuration.nix
sudo nixos-rebuild switch --flake .#nixos
```

## Rebuild
```Shell
nix-switch
```
## Update
```Shell
nix-update
```
