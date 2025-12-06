{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.noice-nvim;
  type = "lua";
  config = builtins.readFile ./noice.lua;
}
