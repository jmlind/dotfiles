{ config, pkgs, ... }: {
  boot.kernelModules = [ "iTCO_wdt" ];

  systemd.settings.Manager = {
    KExecWatchdogSec = "5min";
    RebootWatchdogSec = "10min";
    RuntimeWatchdogSec = "30s";
    WatchdogDevice = "/dev/watchdog";
  };

  services.watchdogd = {
    enable = true;
    settings = {
      meminfo = {
        enabled = true;
        interval = 10;
        critical = 0.95; # default
        warning = 0.9; # default
      };
    };
  };
}
