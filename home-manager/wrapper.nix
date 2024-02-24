{ inputs
, pkgs
, ...
}: {
  home.packages = [
    (inputs.wrapper-manager.lib.build {
      inherit pkgs;
      modules = [{
        wrappers.discord = {
          basePackage = pkgs.discord;
          flags = [
            "--disable-gpu"
          ];
        };
        wrappers.vesktop = {
          basePackage = pkgs.vesktop;
          flags = [
            "--disable-gpu"
          ];
        };
        wrappers.audacity = {
          basePackage = pkgs.audacity;
          env.GTK_THEME.value = "Don't affect Audacity";
        };
      }];
    })
  ];
}
