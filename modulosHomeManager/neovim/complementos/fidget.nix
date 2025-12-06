{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.fidget-nvim;
  type = "lua";
  config = # lua
    ''require("fidget").setup()'';
}
