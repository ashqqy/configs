{
  imports = [
    ./hardware-configuration.nix
    ./swap.nix
    ./niri-outputs.nix
    ./vial.nix

    ../../system/system.nix
    ../../system/user.nix
    ../../system/wayland.nix
    ../../system/throne.nix
    ../../system/fonts.nix
    ../../system/dev.nix
  ];

  networking.hostName = "homebook";

  system.stateVersion = "26.05";
}
