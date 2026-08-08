{ pkgs, inputs, ... }:

{
  programs.yazelix = {
    enable = true;

    package = inputs.yazelix.packages.${pkgs.system}.yazelix-no-rio-no-helix-no-yazi;
    config = {
      settings = {
        editor.command = "${pkgs.helix}/bin/hx";
        shell.program = "zsh";
      };
    };
  };
}
