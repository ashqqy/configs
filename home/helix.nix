{ ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "ayu_evolve";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
      };
    };

    languages = {
      language-server = {
        nixd = {
          command = "nixd";
          config.nixd = {
            nixpkgs.expr = "import (builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs {}";
            options = {
              nixos.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nixos.options";
              home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nixos.options.home-manager.users.type.getSubOptions []";
            };
          };
        };

        clangd = {
          command = "clangd";
        };

        bash-language-server = {
          command = "bash-language-server";
          args = [ "start" ];
        };
      };

      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
        }

        {
          name = "bash";
          language-servers = [ "bash-language-server" ];
          formatter = {
            command = "shfmt";
            args = [
              "-i"
              "2"
              "-ci"
            ];
          };
          auto-format = true;
        }
      ];
    };
  };
}
