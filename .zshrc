# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vivian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/vivi.json)"

alias ll="ls -lh"
alias burn-orphanage="pacman -Qqtd | sudo pacman -Rsu -"
alias fulltree="tree -I \".git\" -a ."
alias "cd.."="cd .."

pokeget $(shuf -i 1-721 -n 1) --hide-name
