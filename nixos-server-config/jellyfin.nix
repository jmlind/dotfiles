{ pkgs, ... }: {
  users.users.jellyfin.extraGroups = [ "nas-media" ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages =
    [ pkgs.jellyfin pkgs.jellyfin-web pkgs.jellyfin-ffmpeg ];
}
