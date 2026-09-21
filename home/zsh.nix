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
      cppfmt = "git ls-files -z '*.cpp' '*.hpp' '*.cc' '*.h' | xargs -0 -r clang-format -i";
    };
  };
}
