{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vial
  ];

  services.udev.packages = [ pkgs.vial ];
}
