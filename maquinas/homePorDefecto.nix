{
  inputs,
  pkgs,
  maquina,
  usuario,
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
    (import ./${maquina}/home.nix { inherit pkgs inputs; })
    ../modulosHomeManager
  ];

  home.stateVersion = "24.11";
}
