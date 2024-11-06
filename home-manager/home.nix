{ pkgs
, ...
}: {
  imports = [
    #    ./spotify.nix
    ./dunst.nix
    ./wrapper.nix
    ./git.nix
    ./pdf.nix

    ./shell
    ./nvim
    ./theming
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
      libsForQt5.kdenlive
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

    ];

    pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = "Bibata-Modern-Ice";
      };
    };
  };

  gtk = {
    enable = true;
    # theme = {
    #   package = pkgs.tokyonight-gtk-theme.override {
    #     colorVariants = [ "dark" ];
    #     tweakVariants = [ "macos" "black" ];
    #   };
    #   name = "Tokyonight-Dark-Compact";
    # };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "Tokyonight-Dark-Borderless";
    };
  };

  programs = {
    kitty = {
      enable = true;
      themeFile = "tokyo_night_night";
      extraConfig = ''
        background_opacity 0.977
        enable_audio_bell no
      '';
    };
    # neovim = {
    #   plugins = with pkgs.vimPlugins; {
    #     nvim-treesitter.withAllGrammars
    #   };
    # };
  };


  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
