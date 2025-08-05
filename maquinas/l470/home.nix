{ pkgs, inputs }:

{
  imports = [
    {
      config.modulosHomeManager = {
        zen.activar = true;
        entornoHyprland.activar = true;
        entornoDeDesarrollo.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [
    vscode
    loupe
    vlc
    prismlauncher
  ];

  programs.vesktop.enable = true;

  services.polkit-gnome.enable = true;
}
