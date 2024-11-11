{ 
  pkgs, 
  inputs,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      initExtraFirst = ''
        autoload -Uz compinit && compinit
      '';
      initExtra = ''
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      '';
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./p10k-config;
          file = "p10k.zsh";
        }
      ];
      shellAliases = {
        "ac" = "arduino-cli";
        "f" = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
        "home-rebuild" = "home-manager switch --flake";
        "system-rebuild" = "sudo nixos-rebuild switch --flake";
      };
    };

    kitty = {
      enable = true;
      themeFile = "tokyo_night_night";
      extraConfig = ''
        font_family JetBrainsMono Nerd Font
        font_size 11.5
        background_opacity 0.977
        enable_audio_bell no
      '';
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "tokyo-night";
        theme_background = false;
        vim_keys = true;
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        "--height 40%"
        "--border"
      ];
      colors = {
        fg = "#545c7e";
        bg = "#1a1b26";
        hl = "#7aa2f7";
        "fg+" = "#c0caf5";
        "bg+" = "#292e42";
        "hl+" = "#7dcfff";
        border = "#c0caf5";
        info = "#bb9af7";
        prompt = "#7dcfff";
        pointer = "#7dcfff";
        marker = "#9ece6a";
        spinner = "#9ece6a";
        header = "#9ece6a";
      };
    };

    bat = {
      enable = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
      extraOptions = [
        "--sort=extension"
        "--group-directories-first"
      ];  
    };

    ripgrep = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    fd
  ];

}
