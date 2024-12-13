{...}:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [
          "custom/logo"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "clock"
          "network"
          "pulseaudio"
          "battery"
        ];


        "hyprland/window" = {
          format = "{title}";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
          };
        };

        "custom/logo" = {
          format = "";
          tooltip = false;
        };

        "pulseaudio" = {
          format = "  {volume}%";
        };

        "network" = {
          format-wifi = "   {essid} ({signalStrength}%)";
          format-ethernet = "󰈀 {ifname}";
          format-disconnected = "󰤮";
          max-length = 50;
        };

        "clock" = {
          interval = 60;
          format = "{:%m/%d %H:%M}";
        };

        "battery" = {
          tooltip = true;
          format = "󰁹 {capacity}%";
        };
      };
    };

    style = ''
      * {
        border: none;
        font-weight: bold;
        font-size: 13px;
        color: #ffffff;
      }

      window#waybar {
        background: rgba(0, 0, 0, 1);
      }

      #custom-logo {
        font-size: 18px;
        margin: 0;
        margin-left: 7px;
        margin-right: 12px;
        padding: 0;
        font-family: NotoSans Nerd Font Mono;
      }

      .modules-left {
        padding: 0 5px;
      }

      .modules-center {
        padding: 0 5px;
      }

      .modules-right {
        padding: 0 5px;
      }

      #workspaces button.active {
        color: #000000;
        background-color: #aaaaaa;
        border-radius: 50%;
      }

      #workspaces button:hover {
        color: #000000;
        border-radius: 50%;
      }

      #clock {
        padding: 0 5px;
      }

      #network {
        padding: 0 5px;
      }

      #pulseaudio {
        padding: 0 5px;
      }

      #battery {
        padding: 0 5px;
      }
    '';
  };
}
