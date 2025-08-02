{ pkgs, ... }:

{
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time --time-format '%I:%M %p | %a • %h | %F' \
          --cmd 'uwsm start hyprland'";
        user    = "greeter";
      };
    };
  };
  
  users.users.greeter = {
    isNormalUser = false;
    description  = "greetd greeter user";
    extraGroups  = [ "video" "audio" ];
    linger        = true;
  };
  
  # sddm
  # services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.sddm = {
    # enable = true;
    # theme = "${pkgs.where-is-my-sddm-theme}/share/sddm/themes/where_is_my_sddm_theme"; 
  # };
  
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
}
