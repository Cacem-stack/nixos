{ config, lib, pkgs, ... }:

{

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.steam.extraCompatPackages = with pkgs; [ proton-ge-bin ];

  programs.gamemode.enable = true;

  programs.gamescope.enable = true;
  programs.gamescope.capSysNice = true;

  hardware.opengl = {
  ## radv: an open-source Vulkan driver from freedesktop
  driSupport = true;
  driSupport32Bit = true;

  ## amdvlk: an open-source Vulkan driver from AMD
  #extraPackages = [ pkgs.amdvlk pkgs.rocmPackages.clr.icd ];
  #extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };


}
