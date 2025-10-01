{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.neovim;

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

  mestizo-nvim = deGithub {
    rev = "66e6889b5817123bce54c11170eb377f69798de4";
    ref = "main";
    repo = "anfigeno/mestizo.nvim";
  };

  propio-modes-nvim = deGithub {
    rev = "7c6ca20de4c9acb22ef06074e39fd2c021b99935";
    ref = "main";
    repo = "mvllow/modes.nvim";
  };

  propio-auto-lsp-nvim = deGithub {
    rev = "fa26c9768e111b43495faebdf1b02c91d36d6753";
    ref = "master";
    repo = "WieeRd/auto-lsp.nvim";
    dependencies = with pkgs.vimPlugins; [ nvim-lspconfig ];
  };

  propio-tiny-code-action-nvim = deGithub {
    rev = "3204f45e4102788486f440259e09d50046081675";
    ref = "main";
    repo = "rachartier/tiny-code-action.nvim";
    dependencies = with pkgs.vimPlugins; [
      plenary-nvim
      snacks-nvim
    ];
  };

  propio-direnv-nvim = deGithub {
    rev = "a2f1264909463fd012b7b0b6bbfebc282c5d2834";
    ref = "main";
    repo = "NotAShelf/direnv.nvim";
  };

  propio-workspaces-nvim = deGithub {
    rev = "55a1eb6f5b72e07ee8333898254e113e927180ca";
    ref = "main";
    repo = "natecraddock/workspaces.nvim";
    dependencies = with pkgs.vimPlugins; [ telescope-nvim ];
  };

  propio-code-runner-nvim = deGithub {
    rev = "386bcaa8aa7ae8703281afce4465ecfdb7c44e65";
    ref = "main";
    repo = "CRAG666/code_runner.nvim";
  };

  propio-lensline-nvim = deGithub {
    rev = "9ae1e4a4d47533dc5bba301e790dcda44ec62be6";
    ref = "main";
    repo = "oribarilan/lensline.nvim";
  };

  propio-keep-split-ratio-nvim = deGithub {
    rev = "906aa5196e194dca12c7729069760d42e77ddcff";
    ref = "main";
    repo = "adlrwbr/keep-split-ratio.nvim";
  };

  propio-import-nvim = deGithub {
    rev = "951075cc5622438f3837d46c9e12e779111ae72d";
    ref = "main";
    repo = "piersolenski/import.nvim";
    dependencies = [ pkgs.vimPlugins.telescope-nvim ];
    nvimSkipModules = [ "import.pickers.telescope" ];
  };
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
      plugins = with pkgs.vimPlugins; [
        {
          plugin = propio-import-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/import.lua;
        }

        {
          plugin = propio-keep-split-ratio-nvim;
          type = "lua";
          config = # lua
            ''require("keep-split-ratio").setup()'';
        }

        {
          plugin = propio-lensline-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/lensline.lua;
        }

        nvim-web-devicons
        {
          plugin = neo-tree-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/neo-tree.lua;
        }

        {
          plugin = ts-autotag-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/ts-autotag.lua;
        }

        nvim-dap-ui
        nvim-dap-go
        nvim-dap-virtual-text
        {
          plugin = nvim-dap;
          type = "lua";
          config = builtins.readFile ./complementos/dap.lua;
        }

        {
          plugin = which-key-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/wich-key.lua;
        }

        {
          plugin = lazydev-nvim;
          type = "lua";
          config = # lua
            ''
              require("lazydev").setup()
            '';
        }

        # {
        #   plugin = avante-nvim;
        #   type = "lua";
        #   config = builtins.readFile ./complementos/avante.lua;
        # }

        # {
        #   plugin = copilot-lua;
        #   type = "lua";
        #   config = builtins.readFile ./complementos/copilot.lua;
        # }

        {
          plugin = no-neck-pain-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/no-neck-pain.lua;
        }

        {
          plugin = statuscol-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/statuscol.lua;
        }

        {
          plugin = propio-code-runner-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/code-runner.lua;
        }

        {
          plugin = propio-workspaces-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/workspaces.lua;
        }

        {
          plugin = propio-direnv-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/direnv.lua;
        }

        {
          plugin = markview-nvim;
          type = "lua";
          config = # lua
            ''require("markview").setup()'';
        }

        {
          plugin = nvim-ufo;
          type = "lua";
          config = builtins.readFile ./complementos/ufo.lua;
        }

        {
          plugin = propio-tiny-code-action-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/tiny-code-action.lua;
        }

        {
          plugin = nvim-navic;
          type = "lua";
          config = builtins.readFile ./complementos/navic.lua;
        }

        {
          plugin = propio-auto-lsp-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/auto-lsp.lua;
        }

        {
          plugin = trouble-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/trouble.lua;
        }

        {
          plugin = tiny-inline-diagnostic-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/tiny-inline-diagnostic.lua;
        }

        {
          plugin = rest-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/rest.lua;
        }

        {
          plugin = lualine-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/lualine.lua;
        }

        {
          plugin = tabout-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/tabout.lua;
        }

        {
          plugin = hover-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/hover.lua;
        }

        {
          plugin = fidget-nvim;
          type = "lua";
          config = # lua
            ''
              require("fidget").setup()
            '';
        }

        {
          plugin = todo-comments-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/todo-comments.lua;
        }

        {
          plugin = stay-centered-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/stay-centered.lua;
        }

        {
          plugin = dashboard-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/dashboard.lua;
        }

        {
          plugin = satellite-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/satellite.lua;
        }

        {
          plugin = mestizo-nvim;
          config = "colorscheme mestizo";
        }

        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile ./lsp.lua;
        }

        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp_luasnip
        lspkind-nvim
        luasnip
        friendly-snippets
        {
          plugin = nvim-autopairs;
          type = "lua";
          config = builtins.readFile ./complementos/autopairs.lua;
        }
        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./complementos/cmp.lua;
        }

        nvim-treesitter.withAllGrammars

        {
          plugin = nvim-treesitter;
          type = "lua";
          config = builtins.readFile ./complementos/treesitter.lua;
        }

        scope-nvim
        {
          plugin = bufferline-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/bufferline.lua;
        }

        {
          plugin = nvim-colorizer-lua;
          type = "lua";
          config = # lua
            ''require("colorizer").setup()'';
        }

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/gitsigns.lua;
        }

        {
          plugin = inc-rename-nvim;
          type = "lua";
          config = # lua
            ''require("inc_rename").setup()'';
        }

        {
          plugin = mini-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/mini.lua;
        }

        {
          plugin = hlchunk-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/hlchunk.lua;
        }

        {
          plugin = propio-modes-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/modes.lua;
        }

        {
          plugin = rainbow-delimiters-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/rainbow-delimiters.lua;
        }

        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/telescope.lua;
        }

        {
          plugin = edgy-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/edgy.lua;
        }

        {
          plugin = neoformat;
          type = "lua";
          config = builtins.readFile ./complementos/neoformat.lua;
        }

        {
          plugin = neocord;
          type = "lua";
          config = # lua
            ''require("neocord").setup()'';
        }

        {
          plugin = noice-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/noice.lua;
        }
      ];
    };
  };
}
