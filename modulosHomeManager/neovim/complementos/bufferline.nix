{ deGithub, pkgs }:

with pkgs.vimPlugins;
[
  scope-nvim
  {
    plugin = bufferline-nvim;
    type = "lua";
    config = builtins.readFile ./bufferline.lua;
  }
]
