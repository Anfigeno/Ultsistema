{ deGithub, pkgs }:

let
  propio-code-runner-nvim = deGithub {
    rev = "386bcaa8aa7ae8703281afce4465ecfdb7c44e65";
    ref = "main";
    repo = "CRAG666/code_runner.nvim";
  };

in
{
  plugin = propio-code-runner-nvim;
  type = "lua";
  config = builtins.readFile ./code-runner.lua;
}
