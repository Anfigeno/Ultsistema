{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.nvim-navic;
  type = "lua";
  config = builtins.readFile ./navic.lua;
}
