{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc_latest
    (lib.hiPrio llvmPackages_latest.clang)
    (lib.hiPrio llvmPackages_latest.llvm)

    gnumake
    cmake
    pkg-config

    gdb
    gcovr

    llvmPackages_latest.clang-tools
    neocmakelsp
    gersemi
    nixd
    nixfmt
    bash-language-server
    shfmt
  ];
}
