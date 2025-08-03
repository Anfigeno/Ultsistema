{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.entornoDeDesarrollo;
in
{
  imports = [ ./configuracionExtra.nix ];

  options.modulosHomeManager.entornoDeDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de entornoDeDesarrollo";
  };

  config.modulosHomeManager = lib.mkIf cfg.activar {
    neovim.activar = true;
    kitty.activar = true;
    fish.activar = true;
    fuentes.activar = true;
    git.activar = true;
    zellij.activar = true;
    yazi.activar = true;
    configuracionExtraDesarrollo.activar = true;
  };
}
