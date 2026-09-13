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
      switch = "sudo nixos-rebuild switch --flake ~/configs#nixos";
      update = "sudo nix flake update";
      garbage = "sudo nix-collect-garbage -d";
      y = "yazi";
    };
  };
}
