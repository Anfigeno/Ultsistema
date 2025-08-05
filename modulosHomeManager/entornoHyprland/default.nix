{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.entornoHyprland;
in
{
  imports = [ ./configuracionExtra.nix ];

  options.modulosHomeManager.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entornoHyprland";
  };

  config.modulosHomeManager = lib.mkIf cfg.activar {
    hyprland.activar = true;
    xdg.activar = true;
    gtk.activar = true;
    qt.activar = true;
    wofi.activar = true;
    eww.activar = true;
    configuracionExtraEntornoHyprland.activar = true;
  };
}
