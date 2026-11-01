{ inputs, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    inputs.asus-numberpad-driver.nixosModules.default
  ];

  networking.hostName = "zenbook";

  # Temporary Workaround for keyboard and touchpad freeze after login
  # To be removed after a patch is available
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];

  nixpkgs.overlays = [ inputs.asus-numberpad-driver.overlays.default ];

  users.users.zeta.extraGroups = [ "i2c" "input" "uinput" ];

  hardware.asus-numberpad-driver = {
    enable = true;
    layout = "up5401ea";
    wayland = true;
    runtimeDir = "/run/user/1000/";
    dbusSessionBusAddress = "unix:path=/run/user/1000/bus";
    waylandDisplay = "wayland-1";
    ignoreWaylandDisplayEnv = false;
    defaultConfig = {
      main = {
        "activation_time" = "0.2";
      };
    };
  };
}
