{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.dunst;
in
{
  options.modulosHomeManager.dunst = {
    activar = lib.mkEnableOption "Activa el módulo de dunst";
  };

  config = lib.mkIf cfg.activar {
    services.dunst = {
      enable = true;
      settings =
        let
          tema = import ../../lib/tema.nix;
        in
        {
          global = {
            width = 300;
            height = 200;
            origin = "top-right";
            gap_size = 4;
            font = "Ubuntu 10";
            corner_radius = 10;
            padding = 12;
            frame_width = 1;
            frame_color = tema.bordeActivo;
            background = tema.fondoClaro;
            foreground = tema.texto;
          };
        };
    };
  };
}
