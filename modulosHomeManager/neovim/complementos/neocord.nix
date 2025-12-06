{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.neocord;
  type = "lua";
  config = builtins.readFile ./neocord.lua;
}
