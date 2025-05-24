{ config, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    historySubstringSearch.enable = true;

    profileExtra = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VNTR" =1 ]; then
        dbus-run-session Hyprland
      fi
    '';

    initExtraFirst = ''
      HISTFILE=~/.histfile
      HISTSIZE=1000
      SAVEHIST=1000
      setopt autocd nomatch
      unsetopt beep extendedglob notify
      autoload -Uz compinit
    '';

    initExtra = ''
      zstyle ":completion:*" menu select
      zstyle ":completion:*" matcher-list "" "m:{a-z0A-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"

      if type nproc &>/dev/null; then
        export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)-1))"
      fi

      bindkey '^[[3~' delete-char
      bindkey '^[[5~' beginning-of-buffer-or-history
      bindkey '^[[6~' end-of-buffer-or-history
      bindkey '^[[1;3D' backword-word
      bindkey '^[[1;3C' forward-word
      bindkey '^[[H' beginning-line
      bindkey '^[[F' end-of-line

      if [ -f $HOME/.zshrc-extra ]; then
        source $HOME/.zshrc-extra
      fi
      pfetch
      eval "$(starship init zsh)"
    '';

    shellAliases = {
      flex = "fastfetch";
      v = "nvim";
      ls = "eza -lah";
      mkdir = "mkdir -p";
      ".." = "cd ..";

      xi = "sudo xbps-install -S";
      xuv = "sudo xbps-install -Su";
      xu = "sudo xbps-install -Su ; #TODO: Nix Package Manager";
      xr = "sudo xbps-remove -R";
      xq = "xbps-query -Rs";
      xlq = "xbps-query -s";
      xcnt = "xbps-query -l | wc -l";
    };
  };
}
