{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./nvidia.nix
    ./general.nix

    ./hardware-configuration.nix
  ];

  nixpkgs = {
    /* overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ]; */

    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = [ "nix-command flakes" ];
    auto-optimise-store = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = "stupidslap";
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users = {
    meh = {
      isNormalUser = true;
      # openssh.authorizedKeys.keys = [
      #   # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      # ];

      extraGroups = [ 
      "network-manager"
      "wheel"
      "dialout"
      "video"
      ];

      shell = pkgs.zsh;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    fzf.keybindings = true;
  };

  # TODO NEED TO CHANGE

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE = "1";
    NIXOS_OZONE_WL = "1";
  }; 

  programs.firefox = {
    enable = true;
    package = pkgs.floorp;
  };
  
  programs.ssh.askPassword = "";

  environment.systemPackages = with pkgs; [
    tree
    home-manager
    neovim
    wget
    git

    #wayland
    waybar
    dunst
    libnotify
    rofi-wayland
  ];


  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     # Forbid root login through SSH.
  #     PermitRootLogin = "no";
  #     # Use keys only. Remove if you want to SSH using password (not recommended)
  #     PasswordAuthentication = false;
  #   };
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
