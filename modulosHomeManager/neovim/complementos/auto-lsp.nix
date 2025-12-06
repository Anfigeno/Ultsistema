{ deGithub, pkgs }:

let
  propio-auto-lsp-nvim = deGithub {
    rev = "fa26c9768e111b43495faebdf1b02c91d36d6753";
    ref = "master";
    repo = "WieeRd/auto-lsp.nvim";
    dependencies = with pkgs.vimPlugins; [ nvim-lspconfig ];
  };
in
{
  plugin = propio-auto-lsp-nvim;
  type = "lua";
  config = builtins.readFile ./auto-lsp.lua;
}
