{ pkgs, lib, ... }: {
  # set up directories with arm user and group ownership
  systemd.tmpfiles.rules = [
    "d /home/arm/logs 0755 arm arm -"
    "d /home/arm/music 0755 arm arm -"
    "d /home/arm/media 0755 arm arm -"
    "d /home/arm/config 0755 arm arm -"
  ];

  # Load the 'sg' kernel module to allow the container to see disk drives
  boot.kernelModules = [ "sg" ];

  # Enable udev to allow the container to see disk drives and other devices
  services.udev.enable = true;

  # Open port 8080 for the web UI of the container
  networking.firewall.allowedTCPPorts = [ 8080 ];

  # Create a user 'arm' for the container; set the password with `passwd`
  users.users.arm = {
    isNormalUser = true;
    description = "arm";
    group = "arm";
    extraGroups = [ "arm" "cdrom" "video" "render" "docker" ];
  };

  # Create a group 'arm' for the container
  users.groups.arm = { };

  # Configure the ARM container
  virtualisation.oci-containers.containers."arm" = {
    autoStart = true; # Automatically start the container on boot
    image = "automaticrippingmachine/automatic-ripping-machine:latest";
    ports = [ "8080:8080" ];
    # TODO: Use id arm to get the UID and GID for the arm user after creation
    environment = {
      ARM_UID = "1001"; # UID of the 'arm' user on the host system
      ARM_GID = "987"; # GID of the 'arm' group on the host system
    };
    # Mount 'host directory' to 'container directory'
    volumes = [
      "/home/arm:/home/arm"
      "/home/arm/music:/home/arm/music"
      "/home/arm/logs:/home/arm/logs"
      "/home/arm/media:/home/arm/media"
      "/home/arm/config:/etc/arm/config"
    ];
    extraOptions = [
      "--device=/dev/sr0:/dev/sr0" # Pass through the CD/DVD drive
      #"--device=/dev/dri:/dev/dri" 
      "--privileged" # Run the container in privileged mode
    ];
  };
}
