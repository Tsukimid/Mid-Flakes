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
        #wrappers.kicad = {
        # basePackage = pkgs.kicad;
        # env.GTK_THEME.value = "Don't affect Audacity";
        #};
      }];
    })
  ];
}
