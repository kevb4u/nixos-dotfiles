{ pkgs, ... }:

{    
  programs.fish.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kevb4u = {
    isNormalUser = true;
    description = "Kevin Balana";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
