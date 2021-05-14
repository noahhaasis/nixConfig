{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.fish}/bin/fish";
      # base16 gruvbox-dark-pale
      colors = {
        primary.background = "0x262626";
        primary.foreground = "0xdab997";
        cursor.text = "0x262626";
        cursor.cursor = "0xdab997";
        normal = {
          black = "0x262626";
          red = "0xd75f5f";
          green = "0xafaf00";
          yellow = "0xffaf00";
          blue = "0x83adad";
          magenta = "0xd485ad";
          cyan = "0x85ad85";
          white = "0xdab997";
        };
        bright = {
          black = "0x8a8a8a";
          red = "0xd75f5f";
          green = "0xafaf00";
          yellow = "0xffaf00";
          blue = "0x83adad";
          magenta = "0xd485ad";
          cyan = "0x85ad85";
          white = "0xebdbb2";
        };
        indexed_colors = [
          { index = 16; color = "0xff8700"; }
          { index = 17; color = "0xd65d0e"; }
          { index = 18; color = "0x3a3a3a"; }
          { index = 19; color = "0x4e4e4e"; }
          { index = 20; color = "0x949494"; }
          { index = 21; color = "0xd5c4a1"; }
        ];
      };
      font = {
        normal = {
          family = "Cascadia Code";
          style = "Medium";
        };
      };
      window = {
        decorations = "full";
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
