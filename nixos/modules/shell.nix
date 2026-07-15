{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ eza direnv tmux stow starship ];
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  programs.starship = { enable = true; };
}
