{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.fish;
in
{
  options.modulosHomeManager.fish = {
    activar = lib.mkEnableOption "Activa el módulo de fish";
  };

  config = lib.mkIf cfg.activar {
    home.packages = [ pkgs.fd ];

    programs.fish = {
      enable = true;
      plugins = import ./plugins.nix { inherit pkgs; };
      shellInit = import ./shellInit.nix { inherit pkgs; };
      interactiveShellInit = import ./interactiveShellInit.nix;
    };
  };
}
