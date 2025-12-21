{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.neovim;
in
{
  options.modulosHomeManager.neovim = {
    activar = lib.mkEnableOption "Activa el módulo de Neovim";
  };

  config = lib.mkIf cfg.activar {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      extraLuaConfig = builtins.readFile ./opciones.lua;
      extraPackages = with pkgs; [
        wl-clipboard
        curl
      ];
      plugins =
        let
          complementos = [
            "base16"
            "supermaven"
            "diagnostic-toggle"
            "mestizo"
            "fyler"
            "smear-cursor"
            "modes"
            "keep-split-ratio"
            # "lensline"
            "ts-autotag"
            "wich-key"
            "lazydev"
            "no-neck-pain"
            "statuscol"
            "code-runner"
            "workspaces"
            "direnv"
            "markview"
            "ufo"
            "tiny-code-action"
            "navic"
            "auto-lsp"
            # "tiny-inline-diagnostic"
            "trouble"
            "rest"
            "lualine"
            "tabout"
            "hover"
            "fidget"
            "todo-comments"
            "stay-centered"
            "dashboard"
            "satellite"
            "lspconfig"
            "cmp-y-autopairs"
            "treesitter"
            "bufferline"
            "colorizer"
            "gitsigns"
            "inc-rename"
            "mini"
            # "avante"
            # "copilot"
            "rainbow-delimiters"
            "telescope"
            "neoformat"
            "neocord"
            "noice"
          ];

          deGithub =
            {
              rev,
              ref,
              repo,
              dependencies ? [ ],
              nvimSkipModules ? [ ],
            }:
            pkgs.vimUtils.buildVimPlugin {
              name = "${lib.strings.sanitizeDerivationName repo}";
              src = builtins.fetchGit {
                url = "https://github.com/${repo}.git";
                ref = ref;
                rev = rev;
              };
              inherit dependencies nvimSkipModules;
            };

          aplanar = lista: builtins.concatMap (x: if builtins.isList x then aplanar x else [ x ]) lista;
        in
        aplanar (
          builtins.map (
            complemento: import ./complementos/${complemento}.nix { inherit deGithub pkgs; }
          ) complementos
        );
    };
  };
}
