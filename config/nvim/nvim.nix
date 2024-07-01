{pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs.vimPlugins; [
      vim-easymotion
      vim-surround
    ];
  };
}

