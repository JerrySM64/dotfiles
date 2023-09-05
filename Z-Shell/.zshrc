# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
unsetopt beep extendedglob notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jerry/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if type nproc &>/dev/null; then   # GNU/Linux
	  export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)-1))"
  elif type sysctl -n hw.ncpu &>/dev/null; then   # macOS, FreeBSD
	    export MAKEFLAGS="$MAKEFLAGS -j$(($(sysctl -n hw.ncpu)-1))"
fi

#Flex to all Mint users
pfetch

PROMPT='%F{green}%n%f@%F{yellow}%m%f %F{yellow}%B%~%b%f %# '

bindkey '^[[3~' delete-char                     # Key Del
bindkey '^[[5~' beginning-of-buffer-or-history  # Key Page Up
bindkey '^[[6~' end-of-buffer-or-history        # Key Page Down
bindkey '^[[1;3D' backward-word                 # Key Alt + Left
bindkey '^[[1;3C' forward-word                  # Key Alt + Right
bindkey '^[[H' beginning-of-line                # Key Home
bindkey '^[[F' end-of-line                      # Key End

# Ignore case-sensitivity when TAB completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

###ALIASES###

#List folder contents the better way
alias ls='exa -lah --color=auto'

#Get confirmation prompt when dealing with files
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#Create folders the better way
alias mkdir='mkdir -p'

# Arch Linux-specific
alias pacin='sudo pacman -S --needed'
alias pacrein='sudo pacman -S'
alias pacrm='sudo pacman -Rs'
alias mkpkg='makepkg -sci'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias update='sudo pacman -Syu'
alias btw='neofetch'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/find-the-command/ftc.zsh askfirst


# Fedora-specific
alias dnfup='sudo dnf update'
alias dnfsync='sudo dnf distro-sync'
alias dnfin='sudo dnf install'
alias dnfrein='sudo dnf reinstall'
alias dnfrm='sudo dnf remove'
alias dnfclean='sudo dnf clean all'
alias rpmdb='sudo rpm --rebuilddb'
alias ofc='fastfetch'

# FreeBSD-specific
alias pkgin='sudo pkg install'
alias pkgrm='sudo pkg remove'
alias fbsd='neofetch'

# NixOS-specific
alias update='sudo nixos-rebuild switch --upgrade'
alias rebuild='sudo nixos-rebuild switch'
alias conf='sudo vim /etc/nixos/configuration.nix'
alias nix='neofetch'
alias envup='nix-env -u'
alias envin='nix-env -iA'
alias envrm='nix-env --uninstall'
alias envlist='nix-env --query'
alias genrm='sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old ; nix-collect-garbage -d ; sudo nixos-rebuild switch'

source /nix/store/zcl7vvhvfjh2iw35wv5jkg2nphzmwmfx-zsh-syntax-highlighting-0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /nix/store/hzpl4hg2dv6jxrq206snd9blj4cb0fyn-zsh-autosuggestions-0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Ubuntu/Debian-specific
alias aptup='sudo apt update ; sudo apt full-upgrade'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'
alias purge='sudo apt purge'
alias clean='sudo apt autoremove'
alias fyi='neofetch'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

# Void-specific
alias xbpsup='sudo xbps-install -Su xbps ; sudo xbps-install -Su'
alias xbps-update='xbps-install -Su xbps ; xbps-install -Su'
alias xbpsin='sudo xbps-install -S'
alias xbpsrm='sudo xbps-remove'
alias void='neofetch'

# View information about your hardware
alias raminfo='sudo dmidecode --type 17'
alias cpuinfo='sudo dmidecode --type 4'
alias mbinfo='sudo dmidecode --type 1'
