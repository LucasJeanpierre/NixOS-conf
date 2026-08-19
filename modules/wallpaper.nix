# e.g. modules/wallpaper.nix, imported into your nixosConfigurations
{ pkgs, ... }:

let
  wallpaperDir = "/home/zeta/nixos-conf/assets/wallpaper-time";

  wallpaperScript = pkgs.writeShellScript "cosmic-wallpaper-by-time" ''
    set -eu
    mapfile -t files < <(find "${wallpaperDir}" -maxdepth 1 -type f | sort -V)
    count=''${#files[@]}
    [ "$count" -eq 0 ] && exit 0

    midnight=$(date -d "today 00:00:00" +%s)
    now=$(date +%s)
    elapsed=$((now - midnight))
    slot_length=$((86400 / count))
    index=$((elapsed / slot_length))
    if [ "$index" -ge "$count" ]; then index=$((count - 1)); fi
    wallpaper="''${files[$index]}"

    config_dir="/home/zeta/.config/cosmic/com.system76.CosmicBackground/v1"
    mkdir -p "$config_dir"
    cat > "$config_dir/all" <<RON
(
  output: "all",
  source: Path("$wallpaper"),
  filter_by_theme: true,
  rotation_frequency: 300,
  filter_method: Lanczos,
  scaling_mode: Zoom,
  sampling_method: Alphanumeric,
)
RON
  '';
in
{
  systemd.services.wallpaper-time-based = {
    description = "Set COSMIC wallpaper based on time of day";
    serviceConfig = {
      Type = "oneshot";
      User = "zeta";
      ExecStart = "${wallpaperScript}";
    };
    before = [ "cosmic-greeter-daemon.service" ];   # use the real name you find
    wantedBy = [ "cosmic-greeter-daemon.service" ];
  };

  systemd.timers.wallpaper-time-based = {
    description = "Re-check time-of-day wallpaper hourly";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
      Unit = "wallpaper-time-based.service";
    };
  };
}
