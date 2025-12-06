{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.ts-autotag-nvim;
  type = "lua";
  config = builtins.readFile ./ts-autotag.lua;
}
