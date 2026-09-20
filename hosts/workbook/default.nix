{
  imports = [
    ../../system/system.nix
    ../../system/user.nix
    ../../system/home-manager.nix
    ../../system/wayland.nix
    ../../system/throne.nix
    ../../system/fonts.nix
    ../../system/virtualisation.nix
  ];

  networking.hostName = "workbook";

  system.stateVersion = "26.11";
}
