{ deGithub, pkgs }:

let
  diagnostic-toggle = deGithub {
    rev = "ae6bf30369dc697b8e298a9cbe2a400124b63531";
    ref = "main";
    repo = "riodelphino/diagnostic-toggle.nvim";
  };
in
{
  plugin = diagnostic-toggle;
  type = "lua";
  config = builtins.readFile ./diagnostic-toggle.lua;
}
