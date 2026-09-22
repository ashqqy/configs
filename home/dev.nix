{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc16
    (lib.hiPrio llvmPackages_latest.clang)

    gnumake
    cmake
    gdb
    pkg-config

    nixd
    nixfmt
    llvmPackages_latest.clang-tools
    bash-language-server
    shfmt
  ];
}
