{
  pkgs,
  inputs,
  hostName,
  ...
}:

{
  imports = [
    ./${hostName}

    ./zsh.nix
    ./kitty.nix
    ./helix.nix
    ./yazi.nix
    ./git.nix
    ./niri.nix
    ./dev.nix
    ./clangd.nix
  ];

  programs.home-manager.enable = true;

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
