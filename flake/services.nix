{ config, lib, pkgs, ... }:

{
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  #services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
  #  "monitor.bluez.properties" = {
  #      "bluez5.enable-sbc-xq" = true;
  #      "bluez5.enable-msbc" = true;
  #      "bluez5.enable-hw-volume" = true;
  #      "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
  #  };
  #};

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
     context.properties = {
       default.clock.rate = 48000;
       default.clock.quantum = 32;
       default.clock.min-quantum = 32;
       default.clock.max-quantum = 32;
    };
  };

  services.fwupd.enable = true;

  networking.networkmanager.enable = true;

  programs.autojump.enable = true;

  services.power-profiles-daemon.enable = true;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
       governor = "powersave";
       turbo = "never";
    };
    charger = {
       governor = "performance";
       turbo = "auto";
    };
  };

  services.envfs.enable = true;

  # hardware.sane.enable = true; # enables support for SANE scanners
  #services.printing.drivers = [ pkgs.gutenprint pkgs.canon-capt ];
  #services.printing.enable = true;
  #services.avahi = {
  #  enable = true;
  #  nssmdns4 = true;
  #  openFirewall = true;
  #};

  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-color;
  };

  services.keyd.enable = true;
  services.keyd.keyboards.default.settings = {
    main = {
      capslock = "overload(vim, esc)";
    };
    vim = {
      h = "left";
      j = "down";
      k = "up";
      l = "right";
      shift = "capslock";
    };
  };

  services.resolved = {
    enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.package = pkgs.bluez;

  services.blueman.enable = true;

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;

  services.libinput.enable = true;

  services.xserver.enable = true;
  services.xserver.synaptics.palmDetect = true;
  services.libinput.touchpad.disableWhileTyping = true;
  services.libinput.mouse.disableWhileTyping = true;

  services.xserver.deviceSection = ''
      Option "VariableRefresh" "true"
  '';
      #Option "AsyncFlipSecondaries" "true"

  services.displayManager.defaultSession = "none+qtile";
  services.xserver.windowManager.qtile.enable = true;
  services.xserver.windowManager.qtile.extraPackages = python3Packages: with python3Packages; [
    qtile-extras
  ];

  # services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  services.autorandr.enable = true;
  services.udev.extraRules = ''ACTION=="change", SUBSYSTEM=="drm", RUN+="${pkgs.autorandr}/bin/autorandr -c"'';

  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;
  services.openssh.enable = true;

  services.flatpak.enable = true;

  #services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  services.xserver.displayManager.sessionCommands = ''
    picom -b
    parcellite -n &
    xbindkeys
    xss-lock --transfer-sleep-lock -- /flake/main/dot/script/i3lock.sh --nofork &
    /home/cac/script/touchacc &
    autorandr --change
    xrdb -merge /home/cac/.Xresources
    unclutter &
    nitrogen --restore
    xset -dpms && xset s 3600 3600
  '';
}
