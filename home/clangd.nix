{ pkgs, ... }:

{
  xdg.configFile."clangd/config.yaml".source = (pkgs.formats.yaml { }).generate "clangd-config" {
    Diagnostics = {
      UnusedIncludes = "Strict";
      MissingIncludes = "Strict";
      ClangTidy = {
        Add = [
          "bugprone-*"
          "performance-*"
          "modernize-*"
          "readability-*"
        ];
        Remove = [
          "modernize-use-trailing-return-type"
          "readability-identifier-length"
          "readability-magic-numbers"
        ];
      };
    };

    InlayHints = {
      ParameterNames = true;
      DeducedTypes = true;
      BlockEnd = true;
      Designators = true;
    };

    Index = {
      Background = "Build";
      StandardLibrary = true;
    };

    Completion = {
      AllScopes = true;
      HeaderInsertion = "IWYU";
    };

    Hover.ShowAKA = true;
  };
}
