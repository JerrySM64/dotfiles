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
# End of lines added by compinstall

if type nproc &>/dev/null; then   # GNU/Linux
	  export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)-1))"
  elif type sysctl -n hw.ncpu &>/dev/null; then   # macOS, FreeBSD
	    export MAKEFLAGS="$MAKEFLAGS -j$(($(sysctl -n hw.ncpu)-1))"
fi

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
alias ls='ls -lah --color=auto'

#Get confirmation prompt when dealing with files
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#Create folders the better way
alias mkdir='mkdir -pv'

# Arch Linux-specific
alias pacin='sudo pacman -S --needed'
alias pacrein='sudo pacman -S'
alias pacrm='sudo pacman -Rs'
alias makepkg='makepkg -sci'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias update='sudo pacman -Syu'
alias btw='neofetch'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/find-the-command/ftc.zsh askfirst

# View information about your hardware
alias raminfo='sudo dmidecode --type 17'
alias cpuinfo='sudo dmidecode --type 4'
alias mbinfo='sudo dmidecode --type 1'
