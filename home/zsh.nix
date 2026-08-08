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
      switch = "sudo nixos-rebuild switch --flake ~/configs";
      update = "sudo nix flake update";
      y = "yazi";
      ide = "zellij --layout ide";
    };
  };
}
