{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      gs = "git status";
      ga = "git add";
      gap = "git add -p";
      gd = "git diff";
      gc = "git commit";
      gcm = "git commit -m";

      v = "vim";

      ls = "exa";
    };
  };
}
