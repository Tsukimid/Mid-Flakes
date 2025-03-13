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
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    # (nerdfonts.override { fonts = ["JetBrainsMono" "Iosevka" ];})
  ];
}
