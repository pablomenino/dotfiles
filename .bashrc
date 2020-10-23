# .bashrc

#----------------------------------------------------------------------#
# global definitions
#----------------------------------------------------------------------#

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

#----------------------------------------------------------------------#
# powerline
#----------------------------------------------------------------------#

# User specific aliases and functions

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bash/powerline.sh
fi

#----------------------------------------------------------------------#
# default software
#----------------------------------------------------------------------#

# default
export EDITOR="vim"
export BROWSER="firefox"
# export BROWSER="google-chrome-stable"

#----------------------------------------------------------------------#
# command alias
#----------------------------------------------------------------------#

alias psl="ps -aux | less"
alias pslx="ps -aux"
alias df="df -h"

#----------------------------------------------------------------------#
# WiFi alias
#----------------------------------------------------------------------#

# Wifi on/off
alias wifi_status="nmcli radio wifi"
alias wifi_list="nmcli device wifi list"
alias wifi_rescan="nmcli device wifi rescan"
alias wifi_on="nmcli radio wifi on"
alias wifi_off="nmcli radio wifi off"

#----------------------------------------------------------------------#
# Compress and decompress
#----------------------------------------------------------------------#

# Extract files
extract ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjvf $1    ;;
            *.tar.gz)    tar xzvf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xjvf $1    ;;
            *.tgz)       tar xzvf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

alias compressdir='tar -zcvf '

#----------------------------------------------------------------------#
# var commands
#----------------------------------------------------------------------#

alias copyprogress='rsync -ahv --progress --partial '
alias temp='sensors'

#----------------------------------------------------------------------#
# git commands
#----------------------------------------------------------------------#

alias git_status='git status'
alias git_add='git add -u; git add .;'
#alias git_push='git commit -m '
#alias git_push='echo "erf"; echo "algo mas";'

dayfile="$(date -d "today" +"%Y%m%d%H%M%S")"
fix="fix_$dayfile"
timestamp=$(date +%s)

git_push ()
{
    if [ -z "$1" ];
    then
        echo "$fix"
        git commit -m "$fix"
        git push
    else
        echo "$1"
        git commit -m "$1"
        git push
    fi
}

alias git_pull='git pull'

git_help ()
{
echo "git_status = git status"
echo "git_add = git add -u; git add .;"
echo "git_push = git commit -m Comment; git push;"
echo "git_pull = git pull"
}

#----------------------------------------------------------------------#
# log files
#----------------------------------------------------------------------#

# Execute "script" command just once
save_term_logfile()
{
    # if there's no SCRIPT_LOG_FILE exported yet
    if [ -z "$SCRIPT_LOG_FILE" ]; then
        # make folder paths
        logdirparent=~/Syslog
        logdirraw=raw-log/$(date +"%Y%m%d")
        logdir=$logdirparent/$logdirraw
        logfile=$logdir/$(date +"%Y%m%d_%H%M%S").$$.rawlog

        # if no folder exist - make one
        if [ ! -d $logdir ]; then
            mkdir -p $logdir
        fi

        export SCRIPT_LOG_FILE=$logfile
        export SCRIPT_LOG_PARENT_FOLDER=$logdirparent

        # quiet output if no args are passed
        if [ ! -z "$1" ]; then
            script -f $logfile
        else
            script -f -q $logfile
        fi

        exit
    fi
}

# Start logging into new file
alias startlog='unset SCRIPT_LOG_FILE && save_term_logfile -v'

# Manually saves current log file: $ savelog logname
savelog(){
    # make folder path
    manualdir=$SCRIPT_LOG_PARENT_FOLDER/save_logs/$(date +"%Y%m%d")
    # if no folder exists - make one
    if [ ! -d $manualdir ]; then
        mkdir -p $manualdir
    fi
    # make log name
    logname=${SCRIPT_LOG_FILE##*/}
    logname=${logname%.*}
    # add user logname if passed as argument
    if [ ! -z $1 ]; then
        logname=$logname'_'$1
    fi
    # make filepaths
    txtfile=$manualdir/$logname'.txt'
    rawfile=$manualdir/$logname'.rawlog'
    # make .rawlog readable and save it to .txt file
    cat $SCRIPT_LOG_FILE | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > $txtfile
    # copy corresponding .rawfile
    cp $SCRIPT_LOG_FILE $rawfile
    printf 'Saved logs:\n    '$txtfile'\n    '$rawfile'\n'
}

# save_term_logfile

#----------------------------------------------------------------------#
#  php local server for debug
#----------------------------------------------------------------------#

# php Server 

alias php-server='php -S localhost:8080 -t ./'
alias php-server-port='php -S localhost:$1 -t ./'

#----------------------------------------------------------------------#
#  tmux / conky / desktop screenshot
#----------------------------------------------------------------------#

# Open Vim with tmux
function vim_tmux() { tmux new -d "vim $*" \; attach; }
#alias vim='vim_tmux'

function conkyshowall() { pslx | grep conky | awk '{ print $2}'; }
function conkykillall() { pslx | grep conky | awk '{ print $2}'; pslx | grep conky | awk '{ print $2}' | xargs kill -9 ; }

function showmydesktopscreen() { screenfetch; scrot --delay 2 --quality 100 $HOME/Pictures/ShowMyDesktop/ShowMyDesktopFriday_%Y-%m-%d_$timestamp.png ; }
function showmydesktopneo() { neofetch --config ~/bin/neofetch.conf; scrot --delay 2 --quality 100 $HOME/Pictures/ShowMyDesktop/ShowMyDesktopFriday_%Y-%m-%d_$timestamp.png ; }

#----------------------------------------------------------------------#
# ping
#----------------------------------------------------------------------#

complete -W 'google.com cyberciti.biz nixcraft.com' ping

alias ping='ping -D -O '

# Stop after sending count ECHO_REQUEST packets #
alias ping5='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias showports='netstat -tulanp'

#----------------------------------------------------------------------#
# alias vscode
#----------------------------------------------------------------------#

# Fix VS Code max files
alias vscode-show-max-files='cat /proc/sys/fs/inotify/max_user_watches'
alias vscode-fix-max-files='sudo sysctl -w fs.inotify.max_user_watches=18192'

# List Extensions and get install command
alias vscode-list-extension='code --list-extensions | xargs -L 1 echo code --install-extension'

#----------------------------------------------------------------------#
# Private config
#----------------------------------------------------------------------#

[ -f $HOME/.bashrc_private ] && . $HOME/.bashrc_private

#----------------------------------------------------------------------#
# History
#----------------------------------------------------------------------#

export HISTSIZE=600
export HISTFILE=~/.bash_history
export HISTFILESIZE=5000
#export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%y/%m/%d %T "


#----------------------------------------------------------------------#
# Update
#----------------------------------------------------------------------#

function fedora-update() { 
        sudo flatpak update -y;
        sudo dnf update --refresh -y;
    }

#----------------------------------------------------------------------#
# Commands
#----------------------------------------------------------------------#


## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# get web server headers #
alias header='curl -I'
 
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

