{
  imports = [
    ./hardware-configuration.nix
    ./swap.nix
    ./vial.nix

    ../../system/system.nix
    ../../system/user.nix
    ../../system/home-manager.nix
    ../../system/wayland.nix
    ../../system/throne.nix
    ../../system/fonts.nix
    ../../system/virtualisation.nix
  ];

  networking.hostName = "homebook";

  system.stateVersion = "26.05";
}
