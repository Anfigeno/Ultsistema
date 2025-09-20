{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.configuracionExtraEntornoHyprland;
in
{
  options.modulosHomeManager.configuracionExtraEntornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de configuracionExtraEntornoHyprland";
  };

  config = lib.mkIf cfg.activar {
    # NOTA: Paquetes extra
    home.packages = with pkgs; [
      nautilus
      nautilus-open-any-terminal
      brightnessctl
      wl-clipboard
    ];

    services.swww.enable = true; # Utilidad de fondo de pantalla
    services.amberol.enable = true; # Reproductor de música minimalista

    # XDG
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config.common.default = [ "hyrpland" ];
    };
  };
}
