# dotfiles

🏠 Personal dotfiles for Fedora Linux.

[WebSite](https://lab.mfwlab.com/lab/dotfiles/)

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

## You can support me:

### Librepay:

<a href="https://liberapay.com/pablomenino/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a>

### Paypal:

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4HPTG85J8NQVG)
