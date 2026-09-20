{ pkgs, ... }:

{
  users.users.artiom = {
    isNormalUser = true;
    description = "Artiom Shafeev";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
