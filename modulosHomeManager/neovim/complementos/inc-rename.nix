{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.inc-rename-nvim;
  type = "lua";
  config = # lua
    ''require("inc_rename").setup()'';
}
