{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.statuscol-nvim;
  type = "lua";
  config = builtins.readFile ./statuscol.lua;
}
