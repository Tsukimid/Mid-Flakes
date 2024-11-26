{ inputs
, pkgs
, ...
}: {
  home.packages = [
    (inputs.wrapper-manager.lib.build {
      inherit pkgs;
      modules = [{
        wrappers.kdenlive = {
          basePackage = pkgs.libsForQt5.kdenlive;
          env.GTK_THEME.value = "Don't affect kdenlive";
        };
        # wrappers.audacity = {
        #   basePackage = pkgs.audacity;
        #   env.GTK_THEME.value = "Don't affect Audacity";
        # };
      }];
    })
  ];
}
