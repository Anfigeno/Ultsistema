{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.gtk;
in
{
  options.modulosHomeManager.gtk = {
    activar = lib.mkEnableOption "Activa el módulo de gtk";
  };

  config = lib.mkIf cfg.activar {
    gtk = {
      enable = true;
      font = {
        name = "Ubuntu";
        package = pkgs.ubuntu_font_family;
      };

      theme = {
        name = "Orchis";
        package = pkgs.orchis-theme;
      };
    };
  };
}
