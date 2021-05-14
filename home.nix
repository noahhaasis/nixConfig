{ config, pkgs, ... }:
let
  defaultPkgs = with pkgs; [
    any-nix-shell # fish support for nix shell
    exa
    fzf
    fish
    firefox
    ripgrep
    rnix-lsp
    nodejs
    cascadia-code
    xclip
    ytop
  ];

  haskellPkgs = with pkgs.haskellPackages; [
    cabal2nix
    cabal-install
    stack
    haskell-language-server
    hoogle
  ];

  xmonadPkgs = with pkgs; [
    nitrogen
  ];
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = (import ./programs) ++ (import ./services);

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "noah";
    homeDirectory = "/home/noah";
    stateVersion = "20.09";

    packages = defaultPkgs ++ haskellPkgs ++ xmonadPkgs;

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
