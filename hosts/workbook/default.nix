{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix

    ../../system/system.nix
    ../../system/user.nix
    ../../system/wayland.nix
    ../../system/programs.nix
    ../../system/packages.nix
    ../../system/fonts.nix
  ];

  networking.hostName = "workbook";

  system.stateVersion = "26.11";
}
