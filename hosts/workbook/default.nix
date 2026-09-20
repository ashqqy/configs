{
  imports = [
    ./hardware-configuration.nix

    ../../system/system.nix
    ../../system/user.nix
    ../../system/wayland.nix
    ../../system/throne.nix
    ../../system/fonts.nix
  ];

  networking.hostName = "workbook";

  system.stateVersion = "26.11";
}
