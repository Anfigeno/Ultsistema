{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.lazydev-nvim;
  type = "lua";
  config = # lua
    ''require("lazydev").setup()'';
}
