{ pkgs, ... }: {
  # mount nas for jellyfin
  fileSystems."/mnt/media" = {
    device = "//mars/media";
    fsType = "cifs";
    options = [
      "credentials=/etc/nixos/mars-secrets"
      "defaults"
      "nofail"
      "x-systemd.after=network-online.target" # Ensure network is up first
      "x-systemd.requires=network-online.target"

      "uid=1000" # homelab
      "gid=100" # homelab
      "file_mode=0770"
      "dir_mode=0770"
    ];
  };

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
