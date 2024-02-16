{ config, lib, pkgs, ... }:

let inherit (import ../../options.nix) flakeDir theShell hostname; in
lib.mkIf (theShell == "zsh") {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    historySubstringSearch.enable = true;
    profileExtra = ''
      #if [ -z "$DISPLAY" ] && [ "$XDG_VNTR" = 1 ]; then
      #  exec Hyprland
      #fi
    '';
    initExtra = ''
      zstyle ":completion:*" menu select
      zstyle ":completion:*" matcher-list "" "m:{a-z0A-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
      if type nproc &>/dev/null; then
        export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)-1))"
      fi
      bindkey '^[[3~' delete-char                     # Key Del
      bindkey '^[[5~' beginning-of-buffer-or-history  # Key Page Up
      bindkey '^[[6~' end-of-buffer-or-history        # Key Page Down
      bindkey '^[[1;3D' backward-word                 # Key Alt + Left
      bindkey '^[[1;3C' forward-word                  # Key Alt + Right
      bindkey '^[[H' beginning-of-line                # Key Home
      bindkey '^[[F' end-of-line                      # Key End
      pfetch
      if [ -f $HOME/.zshrc-personal ]; then
        source $HOME/.zshrc-personal
      fi
      eval "$(starship init zsh)"
    '';
    initExtraFirst = ''
      HISTFILE=~/.histfile
      HISTSIZE=1000
      SAVEHIST=1000
      setopt autocd nomatch
      unsetopt beep extendedglob notify
      autoload -Uz compinit
      compinit
    '';
    sessionVariables = {

    };
    shellAliases = {
      rebuild="nh os switch --nom --hostname ${hostname}";
      rebuild-ask="nh os switch --nom --hostname ${hostname} --ask";
      update="nh os switch --nom --hostname ${hostname} --update";
      genrm="nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      flex="neofetch";
      v="nvim";
      nv="neovide";
      ls="eza -lah color=auto";
      mkdir="mkdir -p";
      ".."="cd ..";
      reboot="systemctl reboot";
      poweroff="systemctl poweroff";
    };
  };
}
