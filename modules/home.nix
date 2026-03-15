{ pkgs, ... }: {
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    everforest-gtk-theme
    papirus-icon-theme
    bibata-cursors
    
    kdePackages.kcalc
    kdePackages.spectacle
    kdePackages.qtstyleplugin-kvantum
    catppuccin-kvantum
    catppuccin-kde
    polonium

    klassy
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "catppuccin-mocha-lavender"; 
      theme = "catppuccin-mocha-lavender";
      cursorTheme = "Bibata-Modern-Ice";
      iconTheme = "Papirus-Dark";
    };

    kwin.virtualDesktops = {
      number = 5;
      rows = 1;
    };

    kwin.scripts.polonium = {
      enable = true;
      settings = {
        borderVisibility = "noBorderAll";
      };
    };

    shortcuts = {
      "kwin" = {
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        
        "Window to Desktop 1" = "Meta+Shift+!";
        "Window to Desktop 2" = "Meta+Shift+@";
        "Window to Desktop 3" = "Meta+Shift+#";
        "Window to Desktop 4" = "Meta+Shift+$";
        "Window to Desktop 5" = "Meta+Shift+%";
        
        "Kill Window" = "Meta+Q";
      };
    };

    panels = [
    {
      location = "top";
      height = 32;
      alignment = "center";
      opacity = "translucent";
      
      widgets = [
        "org.kde.plasma.kickoff"
        
        "org.kde.plasma.panelspacer"
        
        "org.kde.plasma.digitalclock"
        
        "org.kde.plasma.panelspacer"
        
        "org.kde.plasma.systemtray"
      ];
    }
  ];

  };

}