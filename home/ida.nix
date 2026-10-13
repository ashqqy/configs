{ pkgs, config, ... }:

let
  idaDirectory = "${config.home.homeDirectory}/programs/ida";

  ida = pkgs.writeShellApplication {
    name = "ida";

    text = ''
      exec ${idaDirectory}/ida "$@"
    '';
  };
in
{
  home.packages = [ ida ];

  xdg.desktopEntries.ida = {
    name = "IDA";
    genericName = "Disassembler";
    exec = "ida %f";
    icon = "${idaDirectory}/appico.png";
    categories = [ "Development" ];
    terminal = false;
  };
}
