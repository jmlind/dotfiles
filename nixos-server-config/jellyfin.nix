{ pkgs, ... }: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "homelab";
    group = "nas-media";
  };

  environment.systemPackages =
    [ pkgs.jellyfin pkgs.jellyfin-web pkgs.jellyfin-ffmpeg ];
}
