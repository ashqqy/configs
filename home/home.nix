{
  home.username = "artiom";
  home.homeDirectory = "/home/artiom";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./zsh.nix
    ./kitty.nix
    ./helix.nix
    ./yazelix.nix
    ./zellij.nix
  ];
}
