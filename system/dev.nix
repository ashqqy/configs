{
  virtualisation.docker.enable = true;

  programs.wireshark.enable = true;

  users.users.artiom.extraGroups = [
    "docker"
    "wireshark"
  ];
}
