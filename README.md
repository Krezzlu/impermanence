# Impermanence Talk

## Start a NixOS setup with Impermanence

1. Create the configuration with the template
    `nix-shell -p git`
    `nix flake new nixos --template git+https://git.krsnik.at/Kristian/impermanence-talk#default --extra-experimental-features "nix-command flakes"`
    `cd nixos`
    `nix develop --extra-experimental-features "nix-command flakes"`
    `[CHANGE SETTINGS]`
    `sudo disko --mode disko ./systems/disko.nix`
    `[ENTER PASSWORD FOR ENCRYPTION]`
    `cd ..`
    `sudo mv nixos /mnt/persist`
    `cd nixos /mnt/persist/nixos`

    `sudo nixos-generate-config --no-filesystems --force --root /mnt --dir ./system`
    `sudo nixos-install --no-root-password --root /mnt --flake .#default`

