{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.smear-cursor-nvim;
  type = "lua";
  config = # lua
    ''require("smear_cursor").setup();'';
}
