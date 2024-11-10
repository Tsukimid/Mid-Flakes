{
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    corefonts
    vistafonts
    inter
    dancing-script
    jetbrains-mono
    liberation_ttf
    font-awesome
    # (nerdfonts.override { fonts = ["JetBrainsMono" "Iosevka" ];})
    nerdfonts
  ];
}
