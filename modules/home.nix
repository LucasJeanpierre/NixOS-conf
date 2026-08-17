{ pkgs, ... }: 
let
  wallpaperDir = "/home/zeta/nixos-conf/assets/wallpaper-time";

  wallpaperScript = pkgs.writeShellScript "cosmic-wallpaper-by-time" ''
    set -eu

    mapfile -t files < <(find "${wallpaperDir}" -maxdepth 1 -type f | sort -V)
    count=''${#files[@]}

    midnight=$(date -d "today 00:00:00" +%s)
    now=$(date +%s)
    elapsed=$((now - midnight))

    slot_length=$((86400 / count))
    index=$((elapsed / slot_length))
    # clamp in case of rounding at the very end of the day
    if [ "$index" -ge "$count" ]; then
      index=$((count - 1))
    fi

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
  home.stateVersion = "26.05";
  home.username      = "zeta";
  home.homeDirectory = "/home/zeta";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  #xdg.configFile."cosmic/com.system76.CosmicBackground/v1/all".text = ''
  #  (
  #    output: "all",
  #    source: Path("/home/zeta/nixos-conf/assets/wallpaper.png"),
  #    filter_by_theme: true,
  #    rotation_frequency: 300,
  #    filter_method: Lanczos,
  #    scaling_mode: Zoom,
  #    sampling_method: Alphanumeric,
  #  )
  #'';

  systemd.user.services.wallpaper-time-based = {
    Unit.Description = "Set COSMIC wallpaper based on time of day";
    Service = {
      Type = "oneshot";
      ExecStart = "${wallpaperScript}";
    };
    Install.WantedBy = [ "default.target" ];
  };

  systemd.user.timers.wallpaper-time-based = {
    Unit.Description = "Re-check time-of-day wallpaper hourly";
    Timer = {
      OnCalendar = "hourly";
      Persistent = true;
      Unit = "wallpaper-time-based.service";
    };
    Install.WantedBy = [ "timers.target" ];
  };

  xdg.configFile."cosmic/com.system76.CosmicTerm/v1/font_name".text = ''
    "JetBrainsMono Nerd Font Mono"
  '';

  xdg.configFile."cosmic/com.system76.CosmicTerm/v1/show_headerbar".text = ''
    false
  '';

  xdg.configFile."cosmic/com.system76.CosmicTheme.Mode/v1/is_dark".text = ''
    true
  '';

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sky";
  };

  programs = {
    starship.enable = true;
    neovim.enable = true;
    btop.enable = true;
    bat.enable = true;
  };

}
