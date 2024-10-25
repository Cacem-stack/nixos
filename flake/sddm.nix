{ config, pkgs, lib, ... }:

{
environment.systemPackages = [(
  pkgs.catppuccin-sddm.override {
    flavor = "latte";
    font = "Ubuntu";
    fontSize = "16";
    #background = "/home/cac/Pictures/Wallpapers/...";
    loginBackground = true;
  }
)];

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-latte";
    package = pkgs.kdePackages.sddm;
    #theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

#pkgs.stdenv.mkDerivation {
#  name = "catppuccin";
#  src = pkgs.fetchFromGitHub {
#    owner = "catppuccin";
#    repo = "sddm";
#    rev = "743511205d235f4727295943846978b4bdb9ce55";
#    sha256 = "1km85adim11aha06b9aw29y8w725dca02yxi1m93w79jldac9rlr";
#  };
#  installPhase = ''
#    mkdir -p $out
#    cp -R ./* $out/
#    '';
#}
}
