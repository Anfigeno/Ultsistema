{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.xdg;
in
{
  options.modulosHomeManager.xdg = {
    activar = lib.mkEnableOption "Activa el módulo de xdg";
  };

  config = lib.mkIf cfg.activar {
    xdg = {
      enable = true;

      userDirs = {
        enable = true;
        createDirectories = true;

        desktop = "${config.home.homeDirectory}/Escritorio";
        documents = "${config.home.homeDirectory}/Documentos";
        download = "${config.home.homeDirectory}/Descargas";
        music = "${config.home.homeDirectory}/Música";
        pictures = "${config.home.homeDirectory}/Imágenes";
        videos = "${config.home.homeDirectory}/Videos";
        templates = "${config.home.homeDirectory}/Plantillas";
        publicShare = "${config.home.homeDirectory}/Público";
      };

      dataHome = "${config.home.homeDirectory}/.local/share";
      configHome = "${config.home.homeDirectory}/.config";
      cacheHome = "${config.home.homeDirectory}/.cache";
      stateHome = "${config.home.homeDirectory}/.local/state";
    };
  };
}
