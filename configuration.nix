{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    ./modules/system.nix
    ./modules/user.nix
    ./modules/wayland.nix
    ./modules/packages.nix
    ./modules/fonts.nix
    ./modules/yazelix.nix
  ];

  system.stateVersion = "26.05";
}
