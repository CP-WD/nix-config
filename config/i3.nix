{ pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod4";
      bars = [ ];

      window = {
        titlebar = false;
        border = 2;
      };

      gaps = {
        inner = 15;
        outer = 5;
      };

      keybindings = pkgs.lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+space" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "${modifier}+Shift+x" = "exec systemctl suspend";
      };

      startup = [
        # {
        #   command = "exec i3-msg workspace 1";
        #   always = true;
        #   notification = false;
        # }
        {
          command = "polybar";
          always = true;
          notification = false;
        }
        # {
        #   command = "${pkgs.feh}/bin/feh --bg-scale ~/background.png";
        #   always = true;
        #   notification = false;
        # }
      ];
    };
  };
}

