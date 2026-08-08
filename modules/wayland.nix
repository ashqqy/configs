{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];
  
  programs.niri.enable = true;
  
  programs.noctalia-greeter.enable = true;
  
  environment.systemPackages = with pkgs; [
    noctalia-shell
    xwayland-satellite
  ];
  
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    EDITOR = "hx";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-termfilechooser
    ];

    config.common = {
      default = [ "niri" "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "xdg-desktop-portal-termfilechooser" ];
    };
  };

environment.etc."xdg/xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd=${pkgs.writeShellScript "yazi-wrapper" ''
      ${pkgs.kitty}/bin/kitty --class file_chooser -e ${pkgs.yazi}/bin/yazi "$@"
    ''}
  '';
}
