{ pkgs, ... }: {

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # nerd fonts
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
    ];
  };

}
