{
  pkgs,
  ...
}: {
  
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      github.user = "Tsukimid";
    };
    userEmail = "meh23414@gmail.com";
    userName = "Tsukimid";
  };
}
