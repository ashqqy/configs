{
  imports = [
    ../../system

    ../../system/programs/docker.nix
    ../../system/programs/wireshark.nix
    ../../system/programs/throne.nix
  ];

  networking.hostName = "workbook";

  system.stateVersion = "26.11";
}
