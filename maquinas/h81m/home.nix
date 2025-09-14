{ pkgs, inputs }:

{
  imports = [
    {
      config.modulosHomeManager = {
        entornoDeDesarrollo.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [
    glib
  ];

  services.cliphist.enable = true;
}
