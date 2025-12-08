{ deGithub, pkgs }:

with pkgs.vimPlugins;
[
  nvim-lspconfig
  {
    plugin = hover-nvim;
    type = "lua";
    config = builtins.readFile ./hover.lua;
  }
]
