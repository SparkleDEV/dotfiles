# Vivian's dotfiles

This repo contains dotfiles that I am using on my personal system. I mainly host them for myself but feel free to use some of them for yourself.

## How to install

_This is mainly for the case that I forget how stow works_

1. Make sure you have [stow](https://www.gnu.org/software/stow/) installed.
   - For arch based systems run `sudo pacman -S stow` or `yay stow`
2. Clone the repo to a subrdirectory in your `$HOME` directory (i.e. `~/.dotfiles`)
   - Run `git clone git@github.com:SparkleDEV/dotfiles.git ~/.dotfiles` for that
3. Adopt the changes from this repo using stow
   - First, cd into the directory (`cd ~/.dotfiles`)
   - You _could_ now adopt the changes using `stow .` now, although this might fail because of file conflicts.
   - A way around this is changing the command to run `stow --adopt .`, although this will override all the files in the `.dotfiles` directory, so be sure to rollback using `git restore .` after this step.

[Here's the tutorial for that in case I'm stoopid and still can't manage to set this up (which will most likely happen)](https://www.youtube.com/watch?v=y6XCebnB9gs)

## Managed programs

**!! THIS LIST MIGHT NOT BE COMPLETE AS I AM TOO LAZY TO MANAGE !!**

1. kitty
2. zsh
3. fastfetch
