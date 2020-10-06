# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/scripts
export PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
export LD_LIBRARY_PATH

# Fix VS Code max files
sudo sysctl -w fs.inotify.max_user_watches=18192
