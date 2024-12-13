{config, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    envExtra = "disable r";

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake .#myNixOS";
      vscode = "code";
      soundvolume = "alsamixer";
      shutdown = "sudo shutdown now";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "blinks";
    };
  };
}
