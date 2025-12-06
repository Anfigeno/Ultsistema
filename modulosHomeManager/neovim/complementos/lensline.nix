{ deGithub, pkgs }:

let
  propio-lensline-nvim = deGithub {
    rev = "9ae1e4a4d47533dc5bba301e790dcda44ec62be6";
    ref = "main";
    repo = "oribarilan/lensline.nvim";
  };
in
{
  plugin = propio-lensline-nvim;
  type = "lua";
  config = builtins.readFile ./lensline.lua;
}
