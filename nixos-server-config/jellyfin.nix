{ pkgs, ... }: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "homelab";
    group = "users";
  };

  #  services.nginx = {
  #    virtualHosts = {
  #      "media.homelab.local" = {
  #        forceSSL = true;
  #        useACMEHost = "homelab.local";
  #        locations."/" = {
  #          proxyPass = "http://127.0.0.1:8096";
  #          proxyWebsockets = true;
  #        };
  #      };
  #    };
  #  };

  environment.systemPackages =
    [ pkgs.jellyfin pkgs.jellyfin-web pkgs.jellyfin-ffmpeg ];
}
