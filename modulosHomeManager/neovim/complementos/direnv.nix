{ deGithub, pkgs }:

let
  propio-direnv-nvim = deGithub {
    rev = "a2f1264909463fd012b7b0b6bbfebc282c5d2834";
    ref = "main";
    repo = "NotAShelf/direnv.nvim";
  };
in
{
  plugin = propio-direnv-nvim;
  type = "lua";
  config = builtins.readFile ./direnv.lua;
}
