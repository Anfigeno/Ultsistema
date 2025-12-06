{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.stay-centered-nvim;
  type = "lua";
  config = builtins.readFile ./stay-centered.lua;
}
