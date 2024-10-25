{ config, lib, pkgs, ... }:

{

  #fileSystems."/mnt/nixnas_game" = {
  #  device = "nixnas.home.arpa:/home/nas/nfs/game";
  #  fsType = "nfs";
  #  options = [
  #    "nfsvers=4.2"
  #    "defaults"
  #    "user"
  #    "noauto"
  #    "relatime"
  #    "rw"
  #    "x-systemd.automount"
  #  ];
  #};

  #fileSystems."/mnt/steamnas" = {
  #  device = "nixnas.home.arpa:/home/nas/nfs/steam";
  #  fsType = "nfs";
  #  options = [
  #    "nfsvers=4.2"
  #    "noauto"
  #    "noatime"
  #    "async"
  #    "x-systemd.automount"
  #    #"defaults"
  #    #"user"
  #    #"rw"
  #  ];
  #};

  fileSystems."/mnt/steam" = {
    device = "/dev/disk/by-uuid/de7ea693-4239-4418-a0eb-2e402ab720f4";
    options = [
    #  "uuid=1000"
    #  "gid=100"
      #"x-systemd.automount"
      "x-systemd.mount-timeout=3s"
      "nofail"
    ];
  };
}
