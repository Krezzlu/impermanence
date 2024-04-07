{
  description = "Material for a talk about NixOS Impermanence";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = forAllSystems (system: nixpkgs.legacyPackages.${system});
  in {
    # Typst PDF
    # programs = throw "TODO"; # slides

    # For sue with `nix flake init --template </path/to/this/flake>#<template>` or
    # `nix flake new --template .#<template> /path/to/project`
    templates = {
      default = {
        path = ./template;

        description = "A flake template for a NixOS setup with impermanence.";

        welcomeText = "";
      };
    };
  };
}
