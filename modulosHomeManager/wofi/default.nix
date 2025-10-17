{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.wofi;
in
{
  options.modulosHomeManager.wofi = {
    activar = lib.mkEnableOption "Activa el módulo de wofi";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [
      wofi-emoji
      rofi-calc
    ];
    programs.wofi = {
      enable = true;
      settings = {
        width = "40%";
        height = "60%";
        prompt = "Buscar...";
        normal_window = true;
        location = "center";
        gtk-dark = true;
        allow_images = true;
        image_size = 48;
        insensitive = true;
        allow_markup = true;
        no_actions = true;
        orientation = "vertical";
        halign = "fill";
        content_halign = "fill";
      };
      style =
        let
          tema = import ../../lib/tema.nix;
        in
        # css
        ''
          window {
            background-color: ${tema.fondo};
            padding: 50px;
          }

          #input {
            padding: 10px 20px;
            color: ${tema.texto};
            border-radius: 20px;
            margin: 20px 15px;
          }

          #input:selected {
            border-color: ${tema.primario};
          }

          #img {
            margin: 10px 10px;
          }

          #entry {
            border-radius: 0;
            color: ${tema.texto}
          }

          #text:selected,
          #img:selected {
            background-color: transparent;
          }

          #entry:selected {
            background-color: ${tema.primario};
            color : ${tema.fondo};
          }
        '';
    };
  };
}
