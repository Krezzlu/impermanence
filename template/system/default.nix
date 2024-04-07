{...}: {
  imports = [
    (import ./disko.nix {})
    ./impermanence.nix
  ];
}
