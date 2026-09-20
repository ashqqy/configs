{ config, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit inputs;
      hostName = config.networking.hostName;
    };

    users.artiom.imports = [ ../home/home.nix ];
  };
}
