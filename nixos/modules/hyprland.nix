{ pkgs, config, ... }: {
  # wofi is a menu program / app launcher
  # waybar is the status bar
  # hypridle is hyprland's idle daemon
  # hyprlock is gpu accelerated screen locking utility
  environment.systemPackages = with pkgs; [
    hyprland
    wofi
    waybar
    hypridle
    hyprlock
    hyprpaper
  ];

  hardware.graphics.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # https://github.com/nix-community/home-manager/blob/master/programs/waybar.nix
  systemd.user.services.waybar = {
    # this service "works" but fails to launch correctly during hyprland startup. TBD.
    enable = false;
    unitConfig = {
      Description = "Waybar";
      Documentation = "https://github.com/Alexays/Waybar/wiki";
      PartOf = [
        #"wayland-session@hyprland.desktop.target"
        "grapical-session.target"
        "tray.target"
      ];
      After = [
        #     "wayland-session@hyprland.desktop.target"
        "graphical-session.target"
      ];
      ConditionEnvironment = "WAYLAND_DISPLAY";
      # this is more of a home manager thing I believe.
      # TODO: investigate systemd restart trigger watching a file dir, or just reload it via systemctl
      # X-Restart-Triggers = "${config.xdg.configFile."waybar/config".source}";
    };
    serviceConfig = {
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
      ExecStart = "${pkgs.waybar}/bin/waybar";
      KillMode = "mixed";
      Restart = "on-failure";
    };
    wantedBy = [
      # "multi-user.target"
      #  "wayland-session@hyprland.desktop.target"
      "graphical-session.target"
      #  "tray.target"
    ];
  };

  # hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
