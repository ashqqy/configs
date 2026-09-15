{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    telegram-desktop

    vial
  ];

  services.udev.packages = [ pkgs.vial ];
}
