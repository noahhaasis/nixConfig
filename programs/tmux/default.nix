{ pkgs, ... }:

let
  tmuxConf = builtins.readFile ./default.conf;
in
{
  programs.tmux = {
    enable = true;
    extraConfig = tmuxConf;
    shortcut = "a";
    terminal = "screen-256color";
  };
}
