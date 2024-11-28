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

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/M365Princess.omp.json)"

alias ll="ls -lh"
alias la="ls -lha"
alias burn-orphanage="pacman -Qqtd | sudo pacman -Rsu -"
alias fulltree="tree -I \".git\" -a ."

alias update-mirrorlist="$HOME/.scripts/update-mirrorlist.sh"
alias install-vencord="sh -c \"$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)\""

alias "cd.."="cd .."
alias "fuck"="sudo !!"
alias "girlboss"="sudo"

pokeget $(shuf -i 1-721 -n 1) --hide-name
# pokeget $(shuf -e 133 134 135 136 196 197 470 471 700 -n 1) --hide-name $(if [[ $(shuf -i 1-5 -n 1) -eq 1 ]]; then echo --shiny; fi)
. "/home/vivian/.deno/env"
