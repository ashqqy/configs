{ pkgs, inputs, ... }:

{
  home.username = "artiom";
  home.homeDirectory = "/home/artiom";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./zsh.nix
    ./kitty.nix
    ./helix.nix
    ./yazi.nix
    ./git.nix
    ./niri.nix
  ];

  home.packages = with pkgs; [
    zellij
    inputs.xyzide.packages.${pkgs.stdenv.hostPlatform.system}.default
    claude-code
  ];

  programs.z-lua.enable = true;
}
