{ pkgs, ...}:{

    home.packages = with pkgs; [
      bat
      curl
      coreutils
      exa
      git
      gh
      helm
      jq
      kubectl
      k9s
      pgcli
      rclone
      rsync
      watch
      wget
      tmux
      vault
      vim
      telnet
      starship
      unzip
    ];

  programs.home-manager = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };

  programs.git = {
    enable = true;
    extraConfig = {
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      help = {
        autocorrect = "10";
      };
    };
    difftastic = {
      enable = true;
      display = "side-by-side-show-both";
    };
  };
}
