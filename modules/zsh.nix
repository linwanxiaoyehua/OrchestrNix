{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = { "ll" = "ls -al"; };
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "thefuck" ];
    };
  };
}
