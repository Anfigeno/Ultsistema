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
    programs.zen-browser.enable = true;
  };
}
