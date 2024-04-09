{
  pkgs,
  lib,
  ...
}: {
  networking.hostName = "nixos";
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;

  environment.systemPackages = with pkgs; [
    git
  ];

  nix.settings = {
    experimental-features = lib.mkDefault "nix-command flakes";
    auto-optimise-store = true;
    trusted-users = ["root" "@wheel"];
  };

  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = false; # So we don't have to set a password for our user
  };

  users = {
    mutableUsers = false; # Disallow creation of new users and groups

    users."demo" = {
      password = "demo"; # TODO: Maybe put a throw here.
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };

  services.getty.autoLogin = "demo";
  console.keyMap = "de";

  time.timeZone = "Europe/Vienna";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };
}
