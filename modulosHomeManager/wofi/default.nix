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
          orchis = import ../../lib/orchis.nix;
        in
        # css
        ''
          window {
            background-color: ${orchis.grey."700"};
            padding: 50px;
          }

          #input {
            padding: 10px 20px;
            background-color: ${orchis.grey."650"};
            color: ${orchis.white};
            border-radius: 20px;
            margin: 20px 15px;
          }

          #input:focus {
            border-color: ${orchis.purple.light};
          }

          #inner-box {
            background-color: ${orchis.white};
          }

          #img {
            margin: 10px 10px;
          }

          #entry {
            border-radius: 0;
          }

          #text:selected,
          #img:selected {
            background-color: transparent;
          }

          #entry:selected {
            background-color: ${orchis.purple.light};
            color : ${orchis.white};
          }
        '';
    };
  };
}
