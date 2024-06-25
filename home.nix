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
    stylua
    lua
    lua-language-server
    lua54Packages.luacheck

    nil
    unzip
    light
  ];

  programs.rofi.enable = true;
  programs.neovim.enable = true;
  programs.alacritty.enable = true;
  # programs.polybar.enable = true;

  systemd.user.startServices = "sd-switch";

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-configtool
    ];
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
