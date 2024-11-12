{ pkgs,
  lib
, ...
}: {
  imports = [
    ./spotify.nix
    ./dunst.nix
    # ./wrapper.nix
    ./git.nix
    ./pdf.nix

    ./shell
    ./nvim
    ./stylix
  ];

  nixpkgs = {
    overlays = [
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "electron-19.1.9"
      ];
    };
  };

  home = {
    username = "meh";
    homeDirectory = "/home/meh";

    packages = with pkgs; [
      gparted
      krita
      brillo
      vlc
      fritzing
      alacritty
      gnutls
      vial
      docker

      #waylandScreenshot
      grim
      slurp
      wl-clipboard
      grimblast
      swww

      discord
      telegram-desktop
      pdfarranger

      rnote
      libreoffice-still
      keepassxc
      pandoc
      arduino-cli
      playerctl
      arduino

      neofetch
      lf
      nsxiv
      xfce.thunar

      obs-studio
      kicad
    ];
  };

  gtk = {
    enable = true;
  };

  qt = {
    enable = true;
    # platformTheme.name = "gtk";
    # style = {
    #   name = "Tokyonight-Dark";
    # };
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
