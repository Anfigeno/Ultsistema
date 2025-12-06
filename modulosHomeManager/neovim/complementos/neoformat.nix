{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.neoformat;
  type = "lua";
  config = builtins.readFile ./neoformat.lua;
}
