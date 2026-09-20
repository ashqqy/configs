{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    (lib.hiPrio clang)

    gnumake
    cmake
    gdb
    pkg-config

    nixd
    nixfmt
    clang-tools
    bash-language-server
    shfmt
  ];
}
