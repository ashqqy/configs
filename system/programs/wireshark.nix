{
  programs.wireshark.enable = true;

  users.users.artiom.extraGroups = [ "wireshark" ];
}
