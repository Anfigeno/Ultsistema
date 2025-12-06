{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.nvim-lspconfig;
  type = "lua";
}
