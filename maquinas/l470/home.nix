{ pkgs, inputs }:

{
  imports = [
    {
      config.modulosHomeManager = {
        quickshell.activar = false;
        entornoHyprland.activar = true;
        entornoDeDesarrollo.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [
    wpsoffice
    gedit
    vscode
    loupe
    vlc
    prismlauncher
    wasistlos
    glib
    cheese
    jetbrains.idea-community
    file-roller
    totem
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
