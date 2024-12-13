{pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      hop-nvim
    ];
    extraPackages = with pkgs.vimPlugins; [
      vim-easymotion
      vim-surround
    ];
  };
}

