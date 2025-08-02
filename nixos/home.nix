{ config, pkgs, ... }:

{
  home.username = "kevb4u";
  home.homeDirectory = "/home/kevb4u";
  home.stateVersion = "25.05";

  programs.fish = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild switch";
      vim = "nvim";
    };
    
    shellInit = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;33m\]\w\[\e[0m\] \\$ '
    '';
  };

  home.packages = with pkgs; [
    bat
    discord
    obs-studio
    godot
    miru
  ];
}
