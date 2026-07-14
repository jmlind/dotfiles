{ pkgs, ... }: {
  users.groups.nas-media = { };

  # mount nas for jellyfin
  fileSystems."/mnt/media" = {
    device = "//mars/media";
    fsType = "cifs";
    options = [
      "credentials=/etc/nixos/mars-secrets"
      "nofail"
      "noauto"
      "x-systemd.automount"

      "uid=1000" # homelab
      "gid=nas-media" # homelab
      "file_mode=0664"
      "dir_mode=0775"
    ];
  };
}
