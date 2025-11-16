{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.firefox;
in
{
  options.modulosHomeManager.firefox = {
    activar = lib.mkEnableOption "Activa el módulo de firefox";
  };

  config = lib.mkIf cfg.activar {
    programs.firefox = {
      enable = true;

      profiles =
        let
          motoresDeBusqueda = {
            google-ai = {
              name = "Google AI";
              urls = [
                {
                  template = "https://www.google.com/search?udm=50";
                  params = [
                    {
                      name = "udm";
                      value = "50";
                    }
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              definedAliases = [ "@google ai" ];
            };

            nixos-search = {
              name = "Nixos Search";
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              definedAliases = [ "@nixos search" ];
            };

            home-manager-search = {
              name = "Home Manager Search";
              urls = [
                {
                  template = "https://home-manager-options.extranix.com";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              definedAliases = [ "@home manager search" ];
            };

            youtube = {
              name = "YouTube";
              urls = [
                {
                  template = "https://www.youtube.com/results";
                  params = [
                    {
                      name = "search_query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              definedAliases = [ "@youtube" ];
            };
          };
          motorDeBusquedaPredeterminado = motoresDeBusqueda.google-ai.name;
        in
        {
          "Por defecto" = {
            search.engines = motoresDeBusqueda;
            search.default = motorDeBusquedaPredeterminado;
          };
          "Productividad" = {
            search.engines = motoresDeBusqueda;
            search.default = motorDeBusquedaPredeterminado;
          };
          "Procrastinacion" = {
            search.engines = motoresDeBusqueda;
            search.default = motorDeBusquedaPredeterminado;
          };
        };
    };
  };
}
