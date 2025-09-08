{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.hyprland;
in
{
  options.modulosHomeManager.hyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entoronoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = import ./paquetesExtra.nix { inherit pkgs; };

    wayland.windowManager.hyprland = {
      systemd.variables = [ "--all" ];
      enable = true;
      settings = {
        bind = import ./config/atajos.nix { inherit pkgs; };
        windowrule = import ./config/reglasDeVentana.nix { inherit lib; };
        exec-once = import ./config/alIniciar.nix { inherit pkgs; };
        exec = import ./config/alRecargar.nix { inherit pkgs; };
        input = import ./config/entrada.nix;
        bindm = import ./config/atajosDelMouse.nix;
        decoration = import ./config/decoracion.nix;
        misc = import ./config/misc.nix;
        general = import ./config/general.nix;
        group = import ./config/grupo.nix;
      };
    };
  };
}
