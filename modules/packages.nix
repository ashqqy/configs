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
    yazi
    kitty
    helix
    git

    firefox
    telegram-desktop

    vial

    nixd
    nixfmt
    clang-tools
    bash-language-server
    shfmt
  ];

  services.udev.packages = [ pkgs.vial ];
}
