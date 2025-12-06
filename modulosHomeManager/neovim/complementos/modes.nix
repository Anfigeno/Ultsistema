{ deGithub, pkgs }:

let
  propio-modes-nvim = deGithub {
    rev = "7c6ca20de4c9acb22ef06074e39fd2c021b99935";
    ref = "main";
    repo = "mvllow/modes.nvim";
  };

in

{
  plugin = propio-modes-nvim;
  type = "lua";
  config = builtins.readFile ./modes.lua;
}
