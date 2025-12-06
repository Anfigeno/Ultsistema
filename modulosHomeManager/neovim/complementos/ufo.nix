{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.nvim-ufo;
  type = "lua";
  config = builtins.readFile ./ufo.lua;
}
