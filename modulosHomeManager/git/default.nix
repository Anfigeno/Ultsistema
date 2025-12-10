{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.git;
in
{
  options.modulosHomeManager.git = {
    activar = lib.mkEnableOption "Activa el módulo de git";
  };

  config = lib.mkIf cfg.activar {
    programs.git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        user.name = "anfigeno";
        user.email = "dolorcriticodevastador@proton.me";
      };
    };

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options =
        let
          mestizo = import ../../lib/mestizo.nix;
        in
        {
          file-style = "${mestizo.tope} ${mestizo.base3}";
          file-decoration-style = "${mestizo.tope} omit";

          hunk-header-style = "file line-number syntax";
          hunk-header-decoration-style = "bold ${mestizo.base3} omit";
          hunk-header-file-style = "${mestizo.rosa}";

          line-numbers = true;
          line-numbers-zero-style = mestizo.tope_3;
          line-numbers-left-style = "${mestizo.base3}";
          line-numbers-right-style = "${mestizo.base3}";
          line-numbers-minus-style = "${mestizo.rojo} italic";
          line-numbers-plus-style = "${mestizo.verde} italic";

          minus-style = "syntax ${mestizo.especial.rojo_fondo}";
          plus-style = "syntax ${mestizo.especial.verde_fondo}";
          plus-emph-style = "syntax ${mestizo.especial.verde_fondo_2}";
          minus-emph-style = "syntax ${mestizo.especial.rojo_fondo_2}";
        };
    };
  };
}
