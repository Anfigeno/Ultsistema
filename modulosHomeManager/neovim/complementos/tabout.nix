{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.tabout-nvim;
  type = "lua";
  config = builtins.readFile ./tabout.lua;
}
