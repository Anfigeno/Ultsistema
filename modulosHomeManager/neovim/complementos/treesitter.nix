{ deGithub, pkgs }:

with pkgs.vimPlugins;
[
  nvim-treesitter.withAllGrammars
  {
    plugin = nvim-treesitter;
    type = "lua";
    config = builtins.readFile ./treesitter.lua;
  }
]
