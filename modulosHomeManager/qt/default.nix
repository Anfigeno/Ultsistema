{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.qt;
in
{
  options.modulosHomeManager.qt = {
    activar = lib.mkEnableOption "Activa el módulo de qt";
  };

  config = lib.mkIf cfg.activar {
    qt = {
      enable = true;
      platformTheme = "gtk";
      style = {
        name = "gtk2";
        package = pkgs.libsForQt5.breeze-qt5;
      };
    };
  };
}
