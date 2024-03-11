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
        fg = "#c0caf5";
        bg = "#1a1b26";
        hl = "#bb9af7";
        "fg+" = "#c0caf5";
        "bg+" = "#1a1b26";
        "hl+" = "#7dcfff";
        border = "#c0caf5";
        info = "#7aa2f7";
        prompt = "#7dcfff";
        pointer = "#7dcfff";
        marker = "#9ece6a";
        spinner = "#9ece6a";
        header = "#9ece6a";
      };
    };

    bat = {
      enable = true;
      themes = {
        Tokyo-night = {
          src = inputs.bats-theme;
          file = "./extras/sublime/tokyonight_night.tmTheme";
        };
      };
      config = {
        theme = "Tokyo-night";
      };
    };

    eza = {
      enable = true;
      icons = true;
      git = true;
      enableAliases = true;
      extraOptions = [
        "--sort"
        "type"
      ];
    };

    thefuck = {
      enable = true;
      enableZshIntegration = true;
    };

    ripgrep = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    fd
  ];

}
