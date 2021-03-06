{
  "languageserver" = {
    "haskell" = {
      "command" = "haskell-language-server-wrapper";
      "args" = [ "--lsp" ];
      "rootPatterns" = [
        "stack.yaml" 
        "hie.yaml" 
        ".hie-bios"
        "BUILD.bazel"
        ".cabal"
        "cabal.project"
        "package.yaml"
      ];
      "filetypes" = [ "hs" "lhs" "haskell" ];
    };

    "nix" = {
      "command" = "rnix-lsp";
      "filetypes" = [ "nix" ];
    };
  };
}
