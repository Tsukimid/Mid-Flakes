{
  pkgs,
  inputs,
  lib,
  ...
}:
  let 
    spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  in
{
  home.packages = [ pkgs.playerctl ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];
  
  programs.spicetify = {
    enable = true;
    colorScheme = "custom";

    customColorScheme = {
      text               = "a9b1d6";
      subtext            = "c0caf5";
      nav-active-text    = "2ac3de";
      main               = "1a1b26";
      sidebar            = "16161e";
      player             = "16161e";
      card               = "16161e";
      shadow             = "16161e";
      main-secondary     = "16161e";
      button             = "2ac3de";
      button-secondary   = "a9b1d6";
      button-active      = "2ac3de";
      button-disabled    = "a9b1d6";
      nav-active         = "27384e";
      play-button        = "a9b1d6";
      tab-active         = "27384e";
      notification       = "414868";
      notification-error = "ff0000";
      playback-bar       = "2ac3de";
      misc               = "000000";
    }; 

    enabledExtensions = with spicePkgs.extensions; [
      fullAlbumDate
      fullAppDisplay
      keyboardShortcut
      shuffle
      loopyLoop
      adblock
      history
    ];
  }; 
  
  services.playerctld.enable = true;

  imports = [ inputs.spicetify-nix.homeManagerModule ];
}
