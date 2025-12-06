{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.satellite-nvim;
  type = "lua";
  config = builtins.readFile ./satellite.lua;
}
