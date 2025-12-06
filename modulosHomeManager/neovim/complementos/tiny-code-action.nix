{ deGithub, pkgs }:

let
  propio-tiny-code-action-nvim = deGithub {
    rev = "3204f45e4102788486f440259e09d50046081675";
    ref = "main";
    repo = "rachartier/tiny-code-action.nvim";
    dependencies = with pkgs.vimPlugins; [
      plenary-nvim
      snacks-nvim
    ];
  };
in
{
  plugin = propio-tiny-code-action-nvim;
  type = "lua";
  config = builtins.readFile ./tiny-code-action.lua;
}
