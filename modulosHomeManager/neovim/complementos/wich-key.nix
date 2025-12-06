{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.which-key-nvim;
  type = "lua";
  config = builtins.readFile ./wich-key.lua;
}
