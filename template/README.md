# Impermanence Example

## Disk Partitioning

```txt
nix flake new nixos --template git+https://git.krsnik.at/Kristian/impermanence-talk --extra-experimental-features "nix-command flakes"
cd nixos
nix develop --extra-experimental-features "nix-command flakes"
sudo disko --mode disko ./systems/disko.nix

cd ..
mv nixos /persist
cd /persist/nixos
```

While formatting you will be asked for a password which is used for disk encryption with LUKS.
Make sure you have the correct keyboard layout set.

## [Optional] Generate Hardware Configuration (for new Systems)

```txt
sudo nixos-generate-config --no-filesystems --force --root /mnt ./system
```

## Install from Flake

```txt
sudo nixos-install --no-root-password --root /mnt --flake .#
```
