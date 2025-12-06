{ deGithub, pkgs }:

let
  propio-markview-nvim = deGithub {
    rev = "3cd40db264629926f3931fb8a5fe08bcb797b0de";
    ref = "main";
    repo = "OXY2DEV/markview.nvim";
  };
in
{
  plugin = propio-markview-nvim;
  type = "lua";
  config = # lua
    ''require("markview").setup()'';
}
