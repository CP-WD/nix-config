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
    volta
  ];

  # programs.nvim.enable = true;

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
    };

    # 最大化ボタンや最小化ボタンを表示
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
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
