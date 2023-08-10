{ config, pkgs, lib, rootPath, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hua = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      glances
      git
      tree
      zsh
      oh-my-zsh
      nixfmt
      docker
      tmux
      thefuck
    ];
    openssh.authorizedKeys.keyFiles = [
      "${rootPath}/resources/keys/id_rsa.work.pub"
      "${rootPath}/resources/keys/id_rsa.home.pub"
    ];
  };
}
