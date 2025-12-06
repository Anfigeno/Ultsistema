{ deGithub, pkgs }:

let
  propio-keep-split-ratio-nvim = deGithub {
    rev = "906aa5196e194dca12c7729069760d42e77ddcff";
    ref = "main";
    repo = "adlrwbr/keep-split-ratio.nvim";
  };

in
{
  plugin = propio-keep-split-ratio-nvim;
  type = "lua";
  config = # lua
    ''require("keep-split-ratio").setup()'';
}
