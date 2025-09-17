{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.configuracionExtraDesarrollo;
in
{
  options.modulosHomeManager.configuracionExtraDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de configuracionExtraDesarrollo";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [
      # Herramientas
      xclip
      sshfs
      zip
      unzip

      # Entornos de ejecución
      nodejs_20

      # Lenguajes de servidor
      nixd
      nil

      # Formateadores
      nixfmt-classic
    ];

    programs.eza.enable = true;
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    programs.bat.enable = true;
    programs.ripgrep.enable = true;
    programs.jq.enable = true;
    programs.btop.enable = true;
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    programs.gh.enable = true;
  };
}
