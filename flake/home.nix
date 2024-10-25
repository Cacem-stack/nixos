{ config, pkgs, lib, ... }:

let
#  configFilesToLink = {
#    "alacritty/alacritty.yml" = ./alacritty.yml;
#  };

  homeFilesToLink = {
    "configuration.nix" = ./configuration.nix;
  };

  toSource = configDirName: dotfilesPath: { source = dotfilesPath; };
in

{
  home.username = "cac";
  home.homeDirectory = "/home/cac";
#  };
  home.packages = with pkgs; [
    neovide
    librewolf
  ];

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";

  home.stateVersion = "24.05";
#
    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      iconTheme = {
        name = "Adwaita";
        package = pkgs.gnome.adwaita-icon-theme;
      };
    };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
  };

  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;
}
