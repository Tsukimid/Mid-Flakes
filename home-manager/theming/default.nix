{ pkgs
, ...
}: {
  xdg.configFile = {
    "gtk-3.0".source = ./theming/tokyonight-BL-MB-Dark/gtk-3.0/;
  };
}
