{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.rest-nvim;
  type = "lua";
  config = builtins.readFile ./rest.lua;
}
