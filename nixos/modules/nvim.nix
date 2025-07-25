{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ neovim gcc git ripgrep unzip ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
