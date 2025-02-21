set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

oh-my-posh init fish --config $HOME/.config/ohmyposh/atomic.omp.json | source
pokeget $(shuf -i 1-721 -n 1) --hide-name

alias ll="ls -lh"
alias la="ls -lha"
alias fulltree="tree -I \".git\" -a ."

alias burn-orphanage="pacman -Qqtd | sudo pacman -Rsu -"

alias cd..="cd .."
alias girlboss="sudo"

alias vifish="vim $HOME/.config/fish/config.fish"
