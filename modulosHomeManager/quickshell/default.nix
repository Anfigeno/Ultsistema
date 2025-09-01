{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.quickshell;
in
{
  options.modulosHomeManager.quickshell = {
    activar = lib.mkEnableOption "Activa el módulo de quickshell";
  };

  config = lib.mkIf cfg.activar {
    programs.quickshell = {
      enable = true;
    };
  };
}
