{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      switch = "sudo nixos-rebuild switch --flake ~/configs#";
      update = "sudo nix flake update";
      garbage = "sudo nix-collect-garbage -d";
      y = "yazi";
      cppfmt = "git ls-files -z '*.c' '*.h' '*.cpp' '*.hpp' | xargs -0 -r clang-format -i && git ls-files -z '*CMakeLists.txt' '*.cmake' | xargs -0 -r gersemi -i && git ls-files -z '*.json' '*.jsonc' | xargs -0 -r biome format --write --indent-style=space";
    };
  };
}
