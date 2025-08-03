{ inputs, pkgs, maquina, usuario }: 

{
  imports = [
    (import ./${maquina}/home.nix { inherit pkgs; })
    ../modulosHomeManager
  ];

  home.stateVersion = "24.11";
}
