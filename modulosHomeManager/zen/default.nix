{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.zen;
in
{
  options.modulosHomeManager.zen = {
    activar = lib.mkEnableOption "Activa el módulo de zen";
  };

  config = lib.mkIf cfg.activar {
    programs.zen-browser = {
      enable = true;
      profiles = {
        "Por defecto" = {
          id = 0;
        };
        "Productividad" = {
          id = 1;
        };
        "Procrastinacion" = {
          id = 2;
        };
      };
    };

    stylix.targets.zen-browser.profileNames = lib.mkIf config.modulosHomeManager.stylix.activar [
      "Por defecto"
      "Productividad"
      "Procrastinacion"
    ];
  };
}
