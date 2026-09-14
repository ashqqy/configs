{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  programs.zsh.enable = true;

  virtualisation.docker.enable = true;

  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    telegram-desktop

    vial
  ];

  services.udev.packages = [ pkgs.vial ];
}
