{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.copilot-lua;
  type = "lua";
  config = builtins.readFile ./copilot.lua;
}
