{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.nssTools ];
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  # services.avahi.extraServiceFiles = {
  #   n8n = ''
  #     <?xml version="1.0" standalone='no' ?>
  #   '';
  # };

  services.caddy = {
    enable = true;
    virtualHosts."lind.estate".extraConfig = ''
      tls internal
      respond "Hello World"
    '';
    virtualHosts."n8n.lind.estate".extraConfig = ''
      tls internal
      reverse_proxy http://localhost:5678
    '';
    virtualHosts."arm.lind.estate".extraConfig = ''
      tls internal
      reverse_proxy http://localhost:8080
    '';
    virtualHosts."jellyfin.lind.estate".extraConfig = ''
      tls internal
      reverse_proxy http://localhost:8096
    '';
    virtualHosts."photos.lind.estate".extraConfig = ''
      tls internal
      reverse_proxy http://localhost:2283
    '';
    virtualHosts."immich.lind.estate".extraConfig = ''
      tls internal
      reverse_proxy http://localhost:2283
    '';
    virtualHosts."caddy.lind.estate".extraConfig = ''
      tls internal
      root * /srv/certs/
      file_server
    '';
  };
}
