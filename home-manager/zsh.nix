{ pkgs, ... }:

{
  enable = true;

  autosuggestion.enable = true;
  enableVteIntegration = true;

  shellAliases = {
    da = "direnv allow";
    g = "git";
    gs = "git status";
    c = "code";
    n = "nvim";
  };

  initExtra = ''
    # Fancy is colors
    export LS_COLOR="$(${pkgs.vivid}/bin/vivid generate nord)"

    # 'jj' enters normal mode
    bindkey -M viins 'jj' vi-cmd-mode
  '';

  profileExtra = ''
    # Adds cargo packages to $PATH
    export PATH="$HOME/.cargo/bin:$PATH"
  '';

  sessionVariables = {
    # Suppress direnv logs
    DIRENV_LOG_FORMAT = "";

    # Don't use nano
    EDITOR = "nvim";

    # 'jj' enters normal mode
    ZVM_VI_INSERT_ESCAPE_BINDKEY = "jj";
  };

  plugins = [
    {
      name = "fast-syntax-highlighting";
      src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
    }
    {
      name = "zsh-vi-mode";
      src = builtins.fetchGit {
        url = "https://github.com/jeffreytse/zsh-vi-mode";
        rev = "9178e6bea2c8b4f7e998e59ef755820e761610c7";
      };
    }
  ];
}
