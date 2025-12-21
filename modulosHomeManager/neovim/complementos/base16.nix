{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.base16-nvim;
  type = "lua";
  config = builtins.readFile ./base16.lua;
}
