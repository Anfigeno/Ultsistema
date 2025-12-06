{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.gitsigns-nvim;
  type = "lua";
  config = builtins.readFile ./gitsigns.lua;
}
