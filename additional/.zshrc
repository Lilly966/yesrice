# Created by newuser for 5.9

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz compinit

precmd() { vcs_info }

zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' rehash true
#zmodload zsh/complist
compinit -C -d ~/.config/zsh/zcompdump
_comp_options+=(globdots)

#compinit_comp_options+=(globdots)
zstyle ':vcs_info:git:*' formats '%b '

alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

alias vm-on='sudo systemctl start libvirtd.service'
alias vm-off='sudo systemctl stop libvirtd.service'
alias vm-res='sudo systemctl restart libvirtd.service'
alias vim='nvim'
alias update='yay -Syyuu --noconfirm'

alias pc-res='reboot'
alias pc-off='poweroff'

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=~/.config/zsh/zhistory
HISTSIZE=2500
SAVEHIST=2500
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

