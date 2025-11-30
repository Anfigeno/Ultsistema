{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.gtk;
in
{
  options.modulosHomeManager.gtk = {
    activar = lib.mkEnableOption "Activa el módulo de gtk";
  };

  config = lib.mkIf cfg.activar {
    gtk = {
      enable = true;
      font = {
        name = "Iosevka";
        package = pkgs.iosevka;
      };

      theme = {
        name = "Orchis-Red-Light";
        package = pkgs.orchis-theme;
      };

      iconTheme = {
        name = "Reversal";
        package = pkgs.reversal-icon-theme;
      };

      cursorTheme = {
        name = "Bibata-Modern-Amber";
        package = pkgs.bibata-cursors;
      };

      # gtk3.extraConfig = {
      #   "gtk-cursor-theme-name" = "Bibata-Modern-Amber";
      # };
      #
      # gtk4.extraConfig = {
      #   Settings = ''
      #     gtk-cursor-theme-name=Bibata-Modern-Amber
      #   '';
      # };
    };

    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 16;
    };
  };
}
