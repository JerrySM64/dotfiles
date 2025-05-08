{ config, lib, pkgs, ... }:

{
  home = {
    file = {
      ".zshrc" = {
        text = ''
          HISTFILE=~/.histfile
          HISTSIZE=1000
          SAVEHIST=1000
          setopt autocd nomatch
          unsetopt beep extendedglob notify

          pfetch

          autoload -Uz compinit
          compinit

          zstyle ':completion:*' menu select

          if type nproc &>/dev/null; then   # GNU/Linux
            export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)-1))"
          elif type sysctl -n hw.ncpu &>/dev/null; then   # macOS, FreeBSD
            export MAKEFLAGS="$MAKEFLAGS -j$(($(sysctl -n hw.ncpu)-1))"
          fi

          eval "$(starship init zsh)"

          bindkey '^[[3~' delete-char                     # Key Del
          bindkey '^[[5~' beginning-of-buffer-or-history  # Key Page Up
          bindkey '^[[6~' end-of-buffer-or-history        # Key Page Down
          bindkey '^[[1;3D' backward-word                 # Key Alt + Left
          bindkey '^[[1;3C' forward-word                  # Key Alt + Right
          bindkey '^[[H' beginning-of-line                # Key Home
          bindkey '^[[F' end-of-line                      # Key End

          export PATH=~/.config/emacs/bin/:$PATH

          zstyle ":completion:*" matcher-list "" "m:{a-z0A-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
          autoload -Uz compinit && compinit

          alias ls="eza -lah --color=auto"
          alias rm="rm -i"
          alias mkdir="mkdir -p"
          alias v="nvim"
          alias vim="nvim"
          alias update="~/.local/bin/updater"
          alias rebuild="nh os switch --hostname=optinix"
          alias genrm="sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old ; nix-collect-garbage -d ; nh os switch --hostname=optinix"
          alias flex="fastfetch"
          alias ubuntu="distrobox enter ubuntu"
        '';
      };
    };
  };
}