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
    python3
    stylua

    fuzzel
    nil
    unzip
  ];

  programs.neovim.enable = true;

  home.file = {
    ".config/awesome/rc.lua" = {
      source = ./awesome/rc.lua;
      enable = true;
    };
    "Pictures/Wallpapers" = {
      source = ./Wallpapers;
      enable = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "CP-WD";
    userEmail = "hkana2912@outlook.com";
  };

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
