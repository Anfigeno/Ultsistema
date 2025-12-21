{ pkgs, inputs }:

{
  imports = [
    {
      config.modulosHomeManager = {
        entornoHyprland.activar = true;
        entornoDeDesarrollo.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [
    wpsoffice
    vscode
    prismlauncher
    wasistlos
    glib
    cheese
    jetbrains.idea-community
    kdePackages.kdenlive
    alsa-utils
    qbittorrent
    discord
    discord-ptb
  ];

  programs = {
    obs-studio.enable = true;
  };

  services = {
    polkit-gnome.enable = true;
    cliphist.enable = true;
  };
}
