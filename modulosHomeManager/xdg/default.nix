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

      desktopEntries = {
        zen-perfiles = lib.mkIf config.modulosHomeManager.zen.activar {
          name = "Zen Perfiles";
          comment = "Elige tu perfil y abre Zen Browser";
          exec = "zen-beta -p";
          icon = "zen-beta";
          mimeType = [
            "text/html"
            "x-scheme-handler/http"
            "x-scheme-handler/https"
            "x-scheme-handler/about"
            "x-scheme-handler/unknown"
          ];
        };
        neovim = lib.mkIf config.modulosHomeManager.neovim.activar {
          name = "Neovim";
          genericName = "Text Editor";
          comment = "Edita archivos con Neovim";
          exec = "kitty -e nvim %F";
          icon = "nvim";
          terminal = false;
          type = "Application";
          categories = [
            "Utility"
            "TextEditor"
            "Development"
            "IDE"
          ];
          mimeType = [
            "text/plain"
            "text/x-makefile"
            "text/x-c++hdr"
            "text/x-c++src"
            "text/x-chdr"
            "text/x-csrc"
            "text/x-java"
            "text/x-moc"
            "text/x-pascal"
            "text/x-tcl"
            "text/x-tex"
            "application/x-shellscript"
            "text/x-c"
            "text/x-c++"
            "text/x-python"
            "text/x-lua"
            "text/x-rust"
            "text/x-go"
            "text/x-javascript"
            "text/x-typescript"
            "text/html"
            "text/css"
            "text/x-yaml"
            "text/x-json"
            "text/markdown"
            "text/x-nix"
          ];
        };
      };

      mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = "org.gnome.Nautilus.desktop";
          "application/x-gnome-saved-search" = "org.gnome.Nautilus.desktop";
        };
      };
    };
  };
}
