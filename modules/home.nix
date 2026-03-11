{ pkgs, ... }: {
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    everforest-gtk-theme
    papirus-icon-theme
    bibata-cursors
    
    kdePackages.kcalc
    kdePackages.spectacle
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Everforest-Dark-BL";
      package = pkgs.everforest-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
    };
  };

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      cursorTheme = "Bibata-Modern-Ice";
      iconTheme = "Papirus-Dark";
    };

    panels = [
      {
        location = "bottom";
        height = 44;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

  };

}