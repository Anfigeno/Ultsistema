{
  inputs,
  pkgs,
  maquina,
  usuario,
}:

{
  imports = [
    (import ./${maquina}/home.nix { inherit pkgs inputs; })
    ../modulosHomeManager
  ];

  home.stateVersion = "24.11";
}
