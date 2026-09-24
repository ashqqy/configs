{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc_latest
    (lib.hiPrio llvmPackages_latest.clang)
    (lib.hiPrio llvmPackages_latest.llvm) # llvm-cov, llvm-ar, etc.

    gnumake
    cmake
    pkg-config

    gdb
    qemu
    gcovr # coverage reports

    llvmPackages_latest.clang-tools # clangd, clang-format
    neocmakelsp # cmake lsp
    gersemi # cmake formatter
    vscode-langservers-extracted # json lsp
    biome # json formatter
    nixd # nix lsp
    nixfmt # nix formatter
    bash-language-server # bash lsp
    shfmt # shell formatter
  ];
}
