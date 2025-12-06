{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.avante-nvim;
  type = "lua";
  config = builtins.readFile ./avante.lua;
}
