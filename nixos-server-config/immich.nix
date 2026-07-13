{ pkgs, config, ... }: {
  users.users.immich = {
    isNormalUser = true;
    description = "immich";
    group = "immich";
    extraGroups = [ "nas-media" ];
  };

  users.groups.immich = { };

  services.immich = {
    enable = true;
    port = 2283;
    host = "0.0.0.0";
    openFirewall = true;
    mediaLocation = "/mnt/media/immich";
    database = {
      enable = true;
      name = "immich";
      user = "immich";
      createDB = true;
    };
  };

  # systemd.services.immich.after = [ "mnt-media.mount" ];
  # systemd.services.immich.requires = [ "mnt-media.mount" ];
}
