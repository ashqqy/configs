{ pkgs, ... }:

{
  users.users.artiom = {
    isNormalUser = true;
    description = "Artiom Shafeev";
    extraGroups = [ "networkmanager" "wheel" "docker" "wireshark" ];
    shell = pkgs.zsh;
  };
}
