{
  pkgs, 
  inputs, 
  ... 
}: { 

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
    
    autoEnable = false;
    enable = true;

    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    targets = {
      gnome.enable = true;
      grub.enable = true;
      console.enable = true;
    };
  };
}
