{
  pkgs, 
  stylix,
  inputs, 
  lib,
  ... 
}: { 
  gtk = {
    enable = true;
    # theme.name = lib.mkForce "Tokyonight-Dark";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  stylix = {
    base16Scheme = {
      base00 = "#1A1B26";
      base01 = "#1A1B26";
      base02 = "#292e42";
      base03 = "#414868";
      base04 = "#787C99";
      base05 = "#A9B1D6";
      base06 = "#C0CAF5";
      base07 = "#D5D6DB";
      base08 = "#C0CAF5";
      base09 = "#A9B1D6";
      base0A = "#7AA2F7";
      base0B = "#9ECE6A";
      base0C = "#7DCFFF"; 
      base0D = "#7AA2F7";
      base0E = "#BB9AF7";
      base0F = "#F7768E";
    };
    image = ./wall1.jpg;
    
    enable = true;
    autoEnable = false;
    targets = {
      gtk.enable = true;
      xresources.enable = true;
    };

    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
