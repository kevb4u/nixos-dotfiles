{ pkgs, ... }:

{
  programs.firefox.enable = true;
  # programs.appimage.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # Terminal Utils
     ghostty             # Terminal
     vim
     neovim
     wget
     fastfetch
     bat
     btop
     tree
     lm_sensors          # Temperaure check
     git

     # System Applications / Utils
     kdePackages.dolphin # File Manager
     kdePackages.kate    # Text Editor
     waybar              # Taskbar
     rofi-wayland        # App Launcher
     wl-clipboard        # Clipboard
     cliphist            # Clipboard History
     mpv                 # Video Player
     # Audio Player
     imv                 # Image Viewer
     # Excel
     # Powerpoint
     # Word Doc
     zathura             # Pdf Viewer
     # Calculator
     # Disk Manager
     # Flash tool
     # Notification UI
     # Screenshot
     # Unzip
  ];
}
