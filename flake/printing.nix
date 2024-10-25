{ config, pkgs, lib, ... }:

{

  hardware.sane.enable = true;

  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };



}
