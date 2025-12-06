{ deGithub, pkgs }:

with pkgs.vimPlugins;
[
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
    config = builtins.readFile ./autopairs.lua;
  }
  {
    plugin = nvim-cmp;
    type = "lua";
    config = builtins.readFile ./cmp.lua;
  }
]
