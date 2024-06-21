# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  users.defaultUserShell = pkgs.zsh;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ] ++ [
      # inputs.xremap.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    zsh.enable = true;
  };

  # Configure console keymap
  console.keyMap = "jp106";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.opengl.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gavagai = {
    isNormalUser = true;
    description = "gavagai";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    fcitx5
    fcitx5-mozc
    fcitx5-configtool
    fcitx5-gtk
  ];

  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerdfonts
    ];
    fontDir.enable = true;
      fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  # services.xremap = {
  #   userName = "gavagai";
  #   serviceMode = "system";
  #   config = {
  #     virtual_modifiers = [
  #       "MUHENKAN"
  #       "HENKAN"
  #     ];
  #     modmap = [
  #       {
  #         name = "";
  #         remap = {
  #           "CapsLock" = "LEFTALT";
  #           "APOSTROPHE" = "RIGHTCTRL";
  #           "SEMICOLON" = "ENTER";
  #           "TAB" = "ESC";
  #         };
  #       }
  #     ];
  #     keymap = [
  #       {
  #         name = "Muhenkan";
  #         remap = {
  #           "MUHENKAN-y" = "Home";
  #           "MUHENKAN-o" = "End";

  #           "MUHENKAN-h" = "Left";
  #           "MUHENKAN-j" = "Down";
  #           "MUHENKAN-k" = "Up";
  #           "MUHENKAN-l" = "Right";

  #           "MUHENKAN-t" = "TAB";
  #           "MUHENKAN-n" = "BackSpace";

  #           "MUHENKAN-Enter" = "shift-space";
  #         };
  #       }
  #       {
  #         name = "henkan";
  #         remap = {
  #           "HENKAN-q" = "1";
  #           "HENKAN-w" = "2";
  #           "HENKAN-e" = "3";
  #           "HENKAN-r" = "4";
  #           "HENKAN-t" = "5";
  #           "HENKAN-y" = "6";
  #           "HENKAN-u" = "7";
  #           "HENKAN-i" = "8";
  #           "HENKAN-o" = "9";
  #           "HENKAN-p" = "0";

  #           "HENKAN-m" = "APOSTROPHE";
  #           "HENKAN-n" = "SEMICOLON";

  #           "HENKAN-h" = "LEFTBRACE";
  #           "HENKAN-j" = "RIGHTBRACE";
  #           "HENKAN-k" = "MINUS";
  #           "HENKAN-l" = "EQUAL";
  #           "HENKAN-SEMICOLON" = "BACKSLASH";
  #         };
  #       }
  #     ];
  #   };
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
