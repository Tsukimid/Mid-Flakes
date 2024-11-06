{ pkgs
, ...
}: {
  xdg.configFile = {
    "gtk-2.0" = {
      source = ./Tokyonight-Dark/gtk-2.0;
      recursive = true;
    };

    "gtk-3.0" = {
      source = ./Tokyonight-Dark/gtk-3.0;
      recursive = true;
    };

    "gtk-4.0" = {
      source = ./Tokyonight-Dark/gtk-4.0;
      recursive = true;
    };
  };
}
