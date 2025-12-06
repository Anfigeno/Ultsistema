{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.telescope-nvim;
  type = "lua";
  config = builtins.readFile ./telescope.lua;
}
