{ pkgs
, ...
}: {
  imports = [
    ./spotify.nix
    ./dunst.nix
    ./wrapper.nix
    ./git.nix
    ./pdf.nix

    ./shell
    ./nvim
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
      quickemu
      krita
      brillo
      libsForQt5.kdenlive
      vlc
      fritzing
      alacritty

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

      blender
      komga
      kavita
      
      etcher
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
    theme = {
      name = "Tokyonight-Dark-BL";
      package = pkgs.tokyo-night-gtk;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "Tokyonight-Dark-BL";
    };
  };

  programs = {
    kitty = {
      enable = true;
      theme = "Tokyo Night";
      extraConfig = ''
        background_opacity 0.978
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
