# Impermanence Talk

## Start a NixOS setup with Impermanence

```txt
    `nix-shell -p git`
    `nix flake new nixos --template git+https://github.com/Krezzlu/impermanence#default --extra-experimental-features "nix-command flakes"`
    `cd nixos`
    `nix develop --extra-experimental-features "nix-command flakes"`
    `[CHANGE SETTINGS]`
    `sudo disko --mode disko ./systems/disko.nix`
    `[ENTER PASSWORD FOR ENCRYPTION]`
    `sudo nixos-generate-config --no-filesystems --force --root /mnt --dir ./system`
    `sudo nixos-install --no-root-password --root /mnt --flake .#default`

    To save the configuration
    `cd ..`
    `sudo mv nixos /mnt/persist/etc`
    `cd /mnt/persist/etc/nixos`
```

## Get cleared files back

```txt
cd /tmp
mkdir mnt
sudo btrfs subvolume list /
[NOTE the ID]
sudo mount /dev/mapper/crypted -o subvolid=[ID] mnt/
```

