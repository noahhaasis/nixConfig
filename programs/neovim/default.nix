{ pkgs, ... }:
let
  myVimPlugins = with pkgs.vimPlugins; [
    coc-nvim
    vim-rooter
    nerdtree
    fzf-vim
    base16-vim
    vim-nix
  ];

  baseConfig = builtins.readFile ./config.vim;
  cocSettings = builtins.toJSON (import ./coc-settings.nix);
in
{
  programs.neovim = {
    enable = true;
    plugins = myVimPlugins;
    extraConfig = baseConfig;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile = {
    "nvim/coc-settings.json".text = cocSettings;
  };
}
