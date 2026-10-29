# NixOS-conf
NixOS configuration

## Install
```Shell
git clone https://github.com/LucasJeanpierre/NixOS-conf.git ~/nixos-conf && cd ~/nixos-conf
nixos-generate-config --show-hardware-config > hosts/<name>/hardware-configuration.nix
git add hosts/<name>
sudo nixos-rebuild switch --flake .#<name>
```

## Rebuild
```Shell
nix-switch
```
## Update
```Shell
nix-update
```

## Result
<img width="1366" height="768" alt="Screenshot_2026-08-08_13-23-06" src="https://github.com/user-attachments/assets/a77a8db4-4954-4cdd-a039-9adc68e0e4ec" />
