{ deGithub, pkgs }:

with pkgs.vimPlugins;
[
  nvim-web-devicons
  {
    plugin = mini-nvim;
    type = "lua";
    config = builtins.readFile ./mini.lua;
  }
]
