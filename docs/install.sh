#!/bin/bash

echo "!!!DISCLAIMER!!!
I made this dotfile installer JUST FOR MYSELF.
It does things like setting up my hyprland config, installing various packages, changing my shell, etc.
You are totally free to use it, however I don't take responsibility if that script does something you don't want it to do, and I HIGHLY ADVISE AGAINST IT.
So READ THE SCRIPT before you execute."

read -p "Do you want to continue? (y/N) " c_execute
c_execute=${c_execute:-N}

case "$c_execute" in
    y|Y )
    ;;
    * )
        exit 0
    ;;
esac

DOTFILES_DIR=$HOME/.dotfiles


if [ -d "$DOTFILES_DIR" ]; then
    read -p "$DOTFILES_DIR already exists, do you want to override it? (y/N) " choice
    choice=${choice:-N}
    
    case "$choice" in
        y|Y )
            echo "$DOTFILES_DIR will be overwritten."
            rm -rf $DOTFILES_DIR
        ;;
        * )
            echo "User did not consent for $DOTFILES_DIR to be overwritten, aborting."
            exit 0
        ;;
    esac
fi

sudo -v

sudo pacman -S base-devel git

if ! command -v yay &> /dev/null; then
    echo "yay was not found on system, installing..."
    TEMP_DIR=`mktemp -d`
    
    git clone https://aur.archlinux.org/yay.git $TEMP_DIR/yay
    cd $TEMP_DIR/yay
    
    makepkg -si --noconfirm
fi

sudo -v

echo "Installing AUR packages"
yay -S vim fish fastfetch hyfetch nodejs tree git stow nerd-fonts reflector arrpc pokeget oh-my-posh hyprland hyprshot hyprlock hyprpaper hypridle brightnessctl playerctl pavucontrol nm-connection-editor uswm sddm waybar ttf-font-awesome swaync libnotify kitty wofi nautilus --noconfirm --needed

sudo -v

echo "Setting user shell to fish"
sudo chsh -s /bin/fish $USER

echo "arrpc systemd fix..."

sudo cp /usr/lib/systemd/user/arrpc.service /etc/systemd/system/arrpc.service
sudo systemctl enable arrpc --now

echo "Downloading dotfiles"
git clone https://github.com/SparkleDEV/dotfiles.git $DOTFILES_DIR

sudo chmod +x $DOTFILES_DIR/.scripts/*

cd $DOTFILES_DIR

echo "Installing dotfiles"
stow --adopt .
git restore .

echo "Dotfile installation successfully completed"
