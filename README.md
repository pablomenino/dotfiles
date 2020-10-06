# dotfiles

🏠 Personal dotfiles for Fedora Linux.

Installation
------------

Manually clone and install, **Important:** backup your home directory first.

Clone the repository into `~/.dotfiles` and create symbolic links (e.g., `~/.vimrc`).

**Manually clone and install**

```bash

rm ~/.bash_profile
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.bash_profile ~/.bash_profile

rm ~/.bash_logout
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.bash_logout ~/.bash_logout

rm ~/.bashrc
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.bashrc ~/.bashrc

rm -r ~/bin
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/bin/ ~/bin

rm -r ~/.cert
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.cert/ ~/.cert

rm -r ~/.conky
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.conky/ ~/.conky

rm -r ~/scripts
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/scripts/ ~/scripts

rm -r ~/.tmux
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.tmux/ ~/.tmux

rm ~/.tmux.conf
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.tmux.conf ~/.tmux.conf

rm ~/.tmux.conf.local
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.tmux.conf.local ~/.tmux.conf.local

rm -r ~/.vim
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.vim/ ~/.vim

rm ~/.vimrc
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.vimrc ~/.vimrc

rm ~/.vimrc.local
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.vimrc.local ~/.vimrc.local

rm ~/.xbindkeysrc
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.xbindkeysrc ~/.xbindkeysrc

rm ~/.gitconfig
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/.gitconfig ~/.gitconfig

rm ~/.config/alacritty
ln -sv ~/Projects/gitmfwlab/mfwlab/customization/dotfiles/alacritty ~/.config/alacritty

```
