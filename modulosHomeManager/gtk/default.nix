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
        name = "Iosevka";
        package = pkgs.iosevka;
      };

      theme = {
        name = "Orchis-Red-Light";
        package = pkgs.orchis-theme;
      };

      iconTheme = {
        name = "Reversal";
        package = pkgs.reversal-icon-theme;
      };
    };
  };
}
