{ deGithub, pkgs }:

let
  propio-tiny-inline-diagnostic-nvim = deGithub {
    rev = "71f998696a4d63a1fa42a6c70d5931a2001e485b";
    ref = "main";
    repo = "rachartier/tiny-inline-diagnostic.nvim";
    dependencies = with pkgs.vimPlugins; [
      plenary-nvim
      snacks-nvim
    ];
  };
in
{
  plugin = propio-tiny-inline-diagnostic-nvim;
  type = "lua";
  config = builtins.readFile ./tiny-inline-diagnostic.lua;
}
