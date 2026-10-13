{ pkgs, ... }:

{
  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 6767 ];

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Power
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # FHS /bin and /usr/bin
  services.envfs.enable = true;

  # Dynamically linked executables from outside nixpkgs
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libglvnd
    libxkbcommon
    fontconfig
    libx11
    glib
    freetype
    dbus
    wayland
    libdrm
    libxcrypt-legacy
    libsecret
    libxcb
    libxcb-cursor
    libxcb-image
    libxcb-keysyms
    libxcb-render-util
    libxcb-wm
  ];

  # Time and Locale
  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
}
