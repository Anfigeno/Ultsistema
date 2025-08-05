{ pkgs, inputs }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
    {
      config.modulosHomeManager = {
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

  programs.zen-browser.enable = true;
  programs.vesktop.enable = true;
}
