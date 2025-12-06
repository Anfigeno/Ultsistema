{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.no-neck-pain-nvim;
  type = "lua";
  config = builtins.readFile ./no-neck-pain.lua;
}
