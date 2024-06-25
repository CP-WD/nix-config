{ pkgs, ... }:

{
  imports = [
    ./config/files.nix
    ./config/git.nix
    ./config/i3.nix
    ./config/zsh.nix
    ./config/polybar.nix
  ];

  home.username = "gavagai";
  home.homeDirectory = "/home/gavagai";

  home.packages = with pkgs; [
    spotify
    vivaldi
    vscode
    slack
    discord
    zoom
    _1password-gui
    _1password
    go
    nodejs
    gcc
    python3

    fuzzel
    nil
    unzip
  ];

  programs.rofi.enable = true;
  programs.neovim.enable = true;
  programs.alacritty.enable = true;
  # programs.polybar.enable = true;

  systemd.user.startServices = "sd-switch";

  programs.alacritty.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake .#myNixOS";
      shutdown = "shutdown now";
      reboot = "reboot";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

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

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = "waybar";
      monitor="eDP-1,1920x1080@60.00100,0x0,1";
      decoration = {
        rounding = 10;
      };
      bind = [
        "SUPER,space,exec,fuzzel"
        "SUPER,Return,exec,alacritty"

        "SUPERSHIFT,q,killactive"
        "SUPERSHIFT,e,exit"
        "SUPERSHIFT,f,fullscreen"

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

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-configtool
    ];
    # fcitx5.waylandFrontend = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
