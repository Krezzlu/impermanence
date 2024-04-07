# Impermanence Talk

## Start a NixOS setup with Impermanence

1. Create the configuration with the template
    `nix flake init --template https://github.com/Krezzlu/impermanence-talk#default --extra-experimental-features "nix-command flakes"`
2. Change the template to your liking.
    Specifically the `disko.nix` file.
3. `nix develop --extra-experimental-features "nix-command flakes"`
4. `sudo disko --mode disko ./systems/desktop/<system>/disko.nix`
