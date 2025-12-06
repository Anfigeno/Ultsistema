{ deGithub, pkgs }:

let
  mestizo-nvim = deGithub {
    rev = "7b131e9e792dc2c98ab43c76463b241464fc5cdd";
    ref = "main";
    repo = "anfigeno/mestizo.nvim";
  };
in
{
  plugin = mestizo-nvim;
  config = # vim
    "colorscheme mestizo";
}
