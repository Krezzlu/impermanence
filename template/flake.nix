{
  description = "Impermanence Example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };
  };

  outputs = {self, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      minimal = inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          inputs.disko.nixosModules.default
          {
            imports = [
              (import ./system/disko.nix {})
            ];
          }

          inputs.impermanence.nixosModules.impermanence

          ./system
          {
            system.stateVersion = "23.11";
          }
        ];
      };
    };

    formatter = pkgs.alejandra;

    devShells.${system} = {
      default = pkgs.mkShellNoCC {
        packages = [
          inputs.disko.packages.${system}.default
        ];
      };
    };
  };
}
