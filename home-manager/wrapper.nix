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
          ];
        };
      }];
    })
  ];
}
