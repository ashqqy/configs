{
  imports = [
    ./hardware-configuration.nix
    ./swap.nix

    ../../system

    ../../system/programs/docker.nix
    ../../system/programs/wireshark.nix
    ../../system/programs/throne.nix
    ../../system/programs/vial.nix
  ];

  networking.hostName = "homebook";

  system.stateVersion = "26.05";
}
