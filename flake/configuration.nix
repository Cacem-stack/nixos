# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
  user="cac";
in

{
  #Main Config#

  imports = [
      ./hardware-configuration.nix
      ./pkgs.nix
      ./services.nix
      ./sddm.nix
      ./printing.nix
      ./mount.nix
      ./steam.nix
    ];

  #  system.autoUpgrade = {
  #    enable = true;
  #    channel = "https://nixos.org/channels/nixos-stable";
  #  };

  # nixpkgs.config.allowUnfree = true;

  boot.tmp.cleanOnBoot = true;
  # boot.tmp.useTmpfs = true;

  # boot.initrd.kernelModules = [ "amdgpu" ];
  # boot.kernelModules = [ "kvm-amd" "amdgpu" ];
  boot.loader = {
  systemd-boot.enable = true;
  systemd-boot.configurationLimit = 5;
  efi.canTouchEfiVariables = true;
  };

  #boot.kernelPackages = pkgs.linuxPackages;
  #boot.kernelPackages = pkgs.linuxPackages_hardened;

  #boot.kernelParams = [ "acpi=force" "nomodeset" ];
  #boot.kernelParams = [ "acpi=force" ];


  hardware.opengl.enable = true;
  #hardware.opengl.driSupport = true;
  #hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
  #hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];

  nix = {
    settings.auto-optimise-store = true;
    settings.experimental-features = [ "nix-command" "flakes"  ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  networking.hostName = "nixxx"; # Define your hostname.
  #networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Set your time zone.
   time.timeZone = "America/New_York";
  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.${user} = {
     isNormalUser = true;
     extraGroups = [
       "wheel"
       "wireshark"
       "kvm"
       "tty"
       "video"
       "libvirtd"
       "dialout"
       "qemu"
       "docker"
       "wireshark"
       "libvirt"
       "nogroup"
       "scanner"
       "lp"
     ]; # Enable ‘sudo’ for the user.
     initialPassword = "changeme";
   };

  # Or disable the firewall altogether.
   networking.firewall = {
     enable = false;
     allowedTCPPorts = [ 22 111 631 ];
     allowedUDPPorts = [  ];
  };

  users.defaultUserShell=pkgs.zsh;

  programs = {
    zsh = {
      enable = true;
      interactiveShellInit = ''
      	source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '';
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      zsh-autoenv.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "risto";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
        ];
      };
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "AnonymousPro" ]; })
    ubuntu_font_family
  ];

  system.activationScripts = {
  symlink =
    ''
  		 /flake/main/dot/script/symlink.sh
    '';
  };

  security.wrappers = {
    light =
    { setuid = true;
      owner = "root";
      group = "root";
      source = "${pkgs.light}/bin/light";
    };
  };

  environment.sessionVariables = {
      AMD_VULKAN_ICD = "RADV";
      #VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json"
  	};

  system.stateVersion = "24.05"; # Did you read the comment?

}
