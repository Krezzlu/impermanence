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

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      minimal = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence

          ./system
        ];
      };

      formatter = pkgs.alejandra;

      devShells = {
        default = pkgs.mkShellNoCC.mkShellNoCC {
          packages = with pkgs; [
            git
            inputs.disko.packages.default
          ];
        };
      };
    };
  };
}
