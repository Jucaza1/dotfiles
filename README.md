###Dotfiles
##Debian only for nvim plugins
In case nvim plugins fail delete ~/.local/share  or where plugins lay, then run the following
```
sudo apt-get update
sudo apt-get install build-essential libreadline-dev unzip gcc python3 python3-pip
```
Now nvim should install everything correctly

## Stow required
```
git clone github.com/jucaza1/dotfiles ./dotfiles && cd dotfiles
```

```
stow zsh;
stow nvim;
stow i3;
stow kitty;
stow bin;
stow tmux;
stow starship;
stow wall;
stow picom;
stow bash;
```

