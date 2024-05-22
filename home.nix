{ config, pkgs, ... }:

{
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
    gnome.gnome-tweaks
    gnome-extension-manager
    gnome.dconf-editor
    gnomeExtensions.forge
  ];

  programs.git = {
    enable = true;
    userName = "CP-WD";
    userEmail = "hkana2912@outlook.com";
  };

  programs.neovim.enable = true;

  dconf.settings = {
    "org/gnome/shell" = {
      # お気に入りのアプリ
      favorite-apps = [
        "code.desktop"
        "vivaldi-stable.desktop"
        "org.gnome.Console.desktop"
        "1password.desktop"
        "spotify.desktop"
        "slack.desktop"
      ];

      enabled-extensions = [
        "forge@jmmaranan.com"
      ];
    };

    # 最大化ボタンや最小化ボタンを表示
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };

    # Forge
    "org/gnome/shell/extensions/forge" = {
      window-gap-hidden-on-single = true;
    };
    "org/gnome/desktop/wm/keybindings/switch-to-workspace-left"."@as" = ["<Super>y"];
    "org/gnome/desktop/wm/keybindings/switch-to-workspace-right"."@as" = ["<Super>u"];

    "org/gnome/settings-daemon/plugins/media-keys/help"."@as" =  [];
    "org/gnome/desktop/wm/keybindings/minimize"."@as" = [];
    "org/gnome/desktop/wm/keybindings/maximize"."@as" = [];
    "org/gnome/desktop/wm/keybindings/unmaximize"."@as" = [];

    "org/gnome/mutter/keybindings/toggle-tiled-left"."@as" = [];
    "org/gnome/mutter/keybindings/toggle-tiled-right"."@as" = [];

    "org/gnome/settings-daemon/plugins/media-keys/screenreader"."@as" = [];
    "org/gnome/settings-daemon/plugins/media-keys/magnifier"."@as" = [];
    "org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-in"."@as" = [];
    "org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-out"."@as" = [];

    "org/gnome/desktop/wm/keybindings/move-to-monitor-down"."@as" = [];
    "org/gnome/desktop/wm/keybindings/move-to-monitor-left"."@as" = [];
    "org/gnome/desktop/wm/keybindings/move-to-monitor-right"."@as" = [];
    "org/gnome/desktop/wm/keybindings/move-to-monitor-up"."@as" = [];
    "org/gnome/desktop/wm/keybindings/move-to-workspace-left"."@as" = [];
    "org/gnome/desktop/wm/keybindings/move-to-workspace-right"."@as" = [];
    "org/gnome/desktop/wm/keybindings/move-to-workspace-last"."@as" = [];
    "org/gnome/desktop/wm/keybindings/move-to-workspace-1"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-applications"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-applications-backward"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-to-workspace-last"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-to-workspace-1"."@as" = [];
    # "org/gnome/desktop/wm/keybindings/switch-to-workspace-left"."@as" = [];
    # "org/gnome/desktop/wm/keybindings/switch-to-workspace-right"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-group"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-group-backward"."@as" = [];
    "org/gnome/shell/keybindings/focus-active-notification"."@as" = [];
    "org/gnome/settings-daemon/plugins/media-keys/screensaver"."@as" = [];
    "org/gnome/shell/keybindings/toggle-quick-settings"."@as" = [];
    "org/gnome/mutter/wayland/keybindings/restore-shortcuts"."@as" = [];
    "org/gnome/shell/keybindings/toggle-application-view"."@as" = [];
    "org/gnome/shell/keybindings/toggle-message-tray"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-input-source"."@as" = [];
    "org/gnome/desktop/wm/keybindings/switch-input-source-backward"."@as" = [];
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
