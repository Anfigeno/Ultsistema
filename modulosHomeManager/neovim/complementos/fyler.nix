{ deGithub, pkgs }:

let
  propio-fyler-nvim = deGithub {
    rev = "16176d6aacd4673f041832fac8ae857c537666c7";
    ref = "main";
    repo = "A7Lavinraj/fyler.nvim";
  };
in
{
  plugin = propio-fyler-nvim;
  type = "lua";
  config = builtins.readFile ./fyler.lua;
}
