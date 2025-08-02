# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
  let
    home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
  in
{
  imports =
    [
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      ./bootloader.nix
      ./linux-kernal.nix
      ./display-manager.nix
      ./garbage-collect.nix
      # ./auto-update.nix
      ./swap.nix
      ./time.nix
      ./internationalisation.nix
      ./location.nix
      ./keyboard.nix
      ./bluetooth.nix
      ./networking.nix
      ./firewall.nix
      ./vpn.nix
      ./open-ssh.nix
      ./clamav-scanner.nix
      ./printing.nix
      ./fonts.nix
      ./screen.nix
      ./sound.nix
      ./usb.nix
      ./hyprland.nix
      ./users.nix
      ./gaming.nix
    ];
  
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.kevb4u = import ./home.nix;

  # Enable automatic login for the user.
  # services.getty.autologinUser = "kevb4u";

  # Nix Configuration
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];    
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  

  programs.firefox.enable = true;
  # programs.appimage.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # The Nano editor is also installed by default.
     neovim
     wget
     btop
     tree
     lm_sensors # Temperaure check
     git
     fastfetch
     wl-clipboard # copy
     cliphist # Clipboard
     kdePackages.dolphin # File Manager
     kdePackages.kate # Text Editor
     waybar # Taskbar
     rofi-wayland # App Launcher
     mpv # Video Player
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
