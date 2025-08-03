{ pkgs }:

{
  imports = [
    {
      config.modulosHomeManager = {
        entornoHyprland.activar = true;
        entornoDeDesarrollo.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [ vscode ];
}
