{ pkgs
, ...
}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };

  home = {
    packages = [
      pkgs.gcc
      pkgs.libstdcxx5
      pkgs.gnumake
      pkgs.cargo
      pkgs.unzip
      pkgs.cmake
   ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
