{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.nvim-colorizer-lua;
  type = "lua";
  config = # lua
    ''require("colorizer").setup()'';
}
