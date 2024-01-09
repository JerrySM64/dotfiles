# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
unsetopt beep extendedglob notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jerry/.zshrc'

# Flex to all Ubuntu-users
pfetch

autoload -Uz compinit
compinit

# Menu driven autocomplete
zstyle ':completion:*' menu select
# End of lines added by compinstall

if type nproc &>/dev/null; then   # GNU/Linux
	  export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)-1))"
  elif type sysctl -n hw.ncpu &>/dev/null; then   # macOS, FreeBSD
	    export MAKEFLAGS="$MAKEFLAGS -j$(($(sysctl -n hw.ncpu)-1))"
fi

# PROMPT='%F{green}%n%f@%F{yellow}%m%f %F{yellow}%B%~%b%f %# '
eval "$(starship init zsh)"

bindkey '^[[3~' delete-char                     # Key Del
bindkey '^[[5~' beginning-of-buffer-or-history  # Key Page Up
bindkey '^[[6~' end-of-buffer-or-history        # Key Page Down
bindkey '^[[1;3D' backward-word                 # Key Alt + Left
bindkey '^[[1;3C' forward-word                  # Key Alt + Right
bindkey '^[[H' beginning-of-line                # Key Home
bindkey '^[[F' end-of-line                      # Key End

# Add Doom to PATH (Doom Emacs)
export PATH=~/.config/emacs/bin/:$PATH

# Ignore case-sensitivity when TAB completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

###ALIASES###

#List folder contents the better way
alias ls='eza -lah --color=auto'

#Get confirmation prompt when dealing with files
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#Create folders the better way
alias mkdir='mkdir -p'

# Useful
alias ping='ping -c 4'

# Arch Linux-specific
#alias pacin='sudo pacman -S --needed'
#alias pacrein='sudo pacman -S'
#alias pacrm='sudo pacman -Rs'
#alias makepkg='makepkg -sci'
#alias unlock='sudo rm /var/lib/pacman/db.lck'
#alias update='sudo pacman -Syu'
#alias btw='neofetch'

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/doc/find-the-command/ftc.zsh askfirst

# NixOS specific
alias update='bash /home/Jerry/.local/share/updates.sh'
alias rebuild='cd ~/Development/dotfiles ; git add . ; nh os switch --nom --hostname=green-demon ; cd -'
alias genrm='sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old ; nix-collect-garbage -d ; cd ~/Development/dotfiles ; git add . ; nh os switch --nom --hostname=green-demon ; cd -'
alias nix='neofetch'

# View information about your hardware
#alias raminfo='sudo dmidecode --type 17'
#alias cpuinfo='sudo dmidecode --type 4'
#alias mbinfo='sudo dmidecode --type 1'
