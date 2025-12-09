{ pkgs }:

[
  {
    name = "tide";
    src = pkgs.fetchFromGitHub {
      owner = "IlanCosman";
      repo = "tide";
      rev = "44c521ab292f0eb659a9e2e1b6f83f5f0595fcbd";
      sha256 = "sha256-85iU1QzcZmZYGhK30/ZaKwJNLTsx+j3w6St8bFiQWxc=";
    };
  }
  {
    name = "done";
    src = pkgs.fetchFromGitHub {
      owner = "franciscolourenco";
      repo = "done";
      rev = "eb32ade85c0f2c68cbfcff3036756bbf27a4f366";
      sha256 = "sha256-DMIRKRAVOn7YEnuAtz4hIxrU93ULxNoQhW6juxCoh4o=";
    };
  }
  {
    name = "fzf";
    src = pkgs.fetchFromGitHub {
      owner = "PatrickF1";
      repo = "fzf.fish";
      rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
      sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
    };
  }
]
