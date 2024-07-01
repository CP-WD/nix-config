{...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = "waybar";
      monitor="eDP-1,1920x1080@60.00100,0x0,1";
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

        "SUPERSHIFT,q,killactive"
        "SUPERSHIFT,e,exit"
        "SUPER,f,fullscreen"

        "SUPER,h,movefocus,l"
        "SUPER,j,movefocus,d"
        "SUPER,k,movefocus,u"
        "SUPER,l,movefocus,r"
        "SUPERSHIFT,h,swapwindow,l"
        "SUPERSHIFT,j,swapwindow,d"
        "SUPERSHIFT,k,swapwindow,u"
        "SUPERSHIFT,l,swapwindow,r"

        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,0"
        "SUPER,y,workspace,-1"
        "SUPER,u,workspace,+1"

        "SUPERSHIFT,1,movetoworkspace,1"
        "SUPERSHIFT,2,movetoworkspace,2"
        "SUPERSHIFT,3,movetoworkspace,3"
        "SUPERSHIFT,4,movetoworkspace,4"
        "SUPERSHIFT,5,movetoworkspace,5"
        "SUPERSHIFT,6,movetoworkspace,6"
        "SUPERSHIFT,7,movetoworkspace,7"
        "SUPERSHIFT,8,movetoworkspace,8"
        "SUPERSHIFT,9,movetoworkspace,9"
        "SUPERSHIFT,0,movetoworkspace,0"
      ];
    };
  };
}
