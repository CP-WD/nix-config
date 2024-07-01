{...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = ["/home/gavagai/Pictures/Wallpapers/nix_wp_black.png"];
      wallpaper = [
        "eDP-1,/home/gavagai/Pictures/Wallpapers/nix_wp_black.png"
        "HDMI-A-1,/home/gavagai/Pictures/Wallpapers/nix_wp_black.png"
      ];
    };
  };
}
