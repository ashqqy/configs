{ pkgs, inputs, ... }:

{
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./zsh.nix
    ./kitty.nix
    ./helix.nix
    ./yazi.nix
    ./git.nix
    ./niri.nix
    ./dev.nix
  ];

  home.packages = with pkgs; [
    firefox
    telegram-desktop

    zellij
    inputs.xyzide.packages.${pkgs.stdenv.hostPlatform.system}.default
    claude-code
  ];

  programs.z-lua.enable = true;

  home.sessionVariables.EDITOR = "hx";
}
