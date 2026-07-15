{
  description = "nix flake for work mac";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.neovim
	  pkgs.fzf
	  pkgs.bat
	  pkgs.tldr
	  pkgs.wget
	  pkgs.dive
	  pkgs.btop
	  pkgs.lazygit
	  pkgs.tmux
	  pkgs.tmuxifier
	  pkgs.stow
	  pkgs.ripgrep
	  pkgs.direnv
	  pkgs.kitty
	  pkgs.eza
	  pkgs.fish
	  pkgs.docker
	  pkgs.kubectl
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      programs.fish.enable = true;

      users.users.jonathanlind = {
	shell = pkgs.fish;
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Jonathans-MacBook-Pro
    darwinConfigurations."Jonathans-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Jonathans-MacBook-Pro".pkgs;
  };
}
