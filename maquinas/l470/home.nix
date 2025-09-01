{ pkgs, inputs }:

{
  imports = [
    {
      config.modulosHomeManager = {
        quickshell.activar = true;
        zen.activar = true;
        entornoHyprland.activar = true;
        entornoDeDesarrollo.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [
    gedit
    vscode
    loupe
    vlc
    prismlauncher
    wasistlos
    glib
  ];

  programs.vesktop.enable = true;

  services = {
    polkit-gnome.enable = true;
    cliphist.enable = true;
  };
}
