{ pkgs, ... }:

{
  imports = [
    ./config/files.nix
    ./config/git.nix
    ./config/hyprland.nix
    ./config/hyprpaper.nix
    ./config/waybar.nix
    ./config/zsh.nix
    ./config/nvim/nvim.nix
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
    via
  ];

  programs.alacritty.enable = true;

  systemd.user.startServices = "sd-switch";

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      # fcitx5-gtk
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
