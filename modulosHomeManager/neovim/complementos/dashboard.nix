{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.dashboard-nvim;
  type = "lua";
  config = builtins.readFile ./dashboard.lua;
}
