{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.rainbow-delimiters-nvim;
  type = "lua";
  config = builtins.readFile ./rainbow-delimiters.lua;
}
