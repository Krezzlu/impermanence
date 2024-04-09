{...}: {
  imports = [
    # Core system
    (import ./disko.nix {})
    ./impermanence.nix
    ./configuration.nix
  ];
}
