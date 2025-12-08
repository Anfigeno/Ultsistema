{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.supermaven-nvim;
  type = "lua";
  config = builtins.readFile ./supermaven.lua;
}
