{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.hover-nvim;
  type = "lua";
  config = builtins.readFile ./hover.lua;
}
