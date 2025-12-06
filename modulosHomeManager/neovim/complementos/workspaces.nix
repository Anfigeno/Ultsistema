{ deGithub, pkgs }:

let
  propio-workspaces-nvim = deGithub {
    rev = "55a1eb6f5b72e07ee8333898254e113e927180ca";
    ref = "main";
    repo = "natecraddock/workspaces.nvim";
    dependencies = with pkgs.vimPlugins; [ telescope-nvim ];
  };

in
{
  plugin = propio-workspaces-nvim;
  type = "lua";
  config = builtins.readFile ./workspaces.lua;
}
