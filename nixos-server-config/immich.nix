{ pkgs, config, ... }: {
  services.immich = {
    enable = true;
    port = 2283;
    host = "0.0.0.0";
    openFirewall = true;
    database = {
      enable = true;
      name = "immich";
      user = "immich";
      createDB = true;
    };
  };
}
