{ pkgs, config, ... }:

let nasMountPoint = "/mnt/immich";
in {
  users.users.immich = {
    isSystemUser = true;
    group = "immich";
  };
  users.groups.immich = { };

  fileSystems."${nasMountPoint}" = {
    device = "//mars/media/immich";
    fsType = "cifs";
    options = [
      "credentials=/etc/nixos/mars-secrets"
      "defaults"
      "nofail"
      "x-systemd.after=network-online.target" # Ensure network is up first
      "x-systemd.requires=network-online.target"

      "uid=${toString config.users.users.immich.uid}"
      "gid=${toString config.users.groups.immich.gid}"
      "file_mode=0770"
      "dir_mode=0770"
    ];
  };

  services.immich = {
    enable = true;
    port = 2283;
    host = "0.0.0.0";
    openFirewall = true;
    mediaLocation = nasMountPoint;
    database = {
      enable = true;
      name = "immich";
      user = "immich";
      createDB = true;
    };
  };

  systemd.services.immich.after = [ "mnt-immich.mount" ];
  systemd.services.immich.requires = [ "mnt-immich.mount" ];
}
