{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      maquinas = [ "l470" "h81m" ];
      usuario = "anfitrion";
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (maquina: {
          name = maquina;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit
                inputs
                system
                pkgs
                maquina
                usuario
                ;
            };
            modules = [
              home-manager.nixosModules.home-manager
              ./maquinas/configuracionPorDefecto.nix
            ];
          };
        }) maquinas
      );

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nixd
          nil
          nixfmt-rfc-style

          lua-language-server
          stylua
        ];
      };
    };
}
