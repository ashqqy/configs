{
  nix.settings = {
    extra-substituters = [ "https://pwndbg.cachix.org" ];
    extra-trusted-public-keys = [
      "pwndbg.cachix.org-1:HhtIpP7j73SnuzLgobqqa8LVTng5Qi36sQtNt79cD3k="
    ];
  };
}
