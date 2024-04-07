# Impermanence Example

## Disk Partitioning

```txt
nix develop .#first-install --extra-experimental-features "nix-command flakes"
sudo disko --mode disko ./systems/desktop/<system>/disko.nix
```

While formatting you will be asked for a password which is used for disk encryption with LUKS.
Make sure you have the correct keyboard layout set.

## [Optional] Generate Hardware Configuration (for new Systems)

```txt
sudo nixos-generate-config --no-filesystems --root /mnt
```

Integrate into existing config.

## Install from Flake

```txt
sudo nixos-install --no-root-password --root /mnt --flake .#<system>
```

