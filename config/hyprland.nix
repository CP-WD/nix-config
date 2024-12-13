{ pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "waybar"
        "hyprctl dispatch focusmonitor HDMI-A-1"
      ];
      misc = {
        force_default_wallpaper = 0;
      };
      monitor=[
        "HDMI-A-1, 3440x1440@60.00, -3440x-360, 1"
        "eDP-1,    1920x1080@60.00, 0x0,        1"
      ];
      input={
        sensitivity = 0.7;
      };
      workspace = [
        "HDMI-A-1, 1"
        "eDP-1, 6"

        "1, monitor:HDMI-A-1"
        "2, monitor:HDMI-A-1"
        "3, monitor:HDMI-A-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"

        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
        "9, monitor:eDP-1"
        "10, monitor:eDP-1"
      ];
      decoration = {
        rounding = 5;
      };
      general = {
        border_size = 3;
        # gap = 10;
        # snap = 10;
      };
      bind = [
        "SUPER,space,exec,fuzzel"
        "SUPER,Return,exec,alacritty"

        "SUPER,q,killactive"
        "SUPER,s,fullscreen"

        "SUPER,h,movefocus,l"
        "SUPER,j,movefocus,d"
        "SUPER,k,movefocus,u"
        "SUPER,l,movefocus,r"
        "SUPERSHIFT,h,swapwindow,l"
        "SUPERSHIFT,j,swapwindow,d"
        "SUPERSHIFT,k,swapwindow,u"
        "SUPERSHIFT,l,swapwindow,r"

        "SUPER,y,workspace,-1"
        "SUPER,u,workspace,+1"

        "SUPERSHIFT,y,movetoworkspace,-1"
        "SUPERSHIFT,u,movetoworkspace,+1"
      ];
    };
  };
}
