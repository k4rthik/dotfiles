#export stuff
export PATH=/usr/local/bin:$PATH:$HOME/.bin

if [ -x "$(which "brew" 2>/dev/null)" ]; then
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    #tab complete more commands
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        source $(brew --prefix)/etc/bash_completion
    fi
fi

if [ "$(uname)" == "Darwin" ]; then
    export EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
else
    export EDITOR=emacsclient
fi

#history, defaults are not enough
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL=ignoredups

shopt -s histappend

shopt -s nocaseglob

if [ ! -f $HOME/.git-prompt.sh ]; then
    wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O $HOME/.git-prompt.sh
fi
source $HOME/.git-prompt.sh

PS1='\[\033[32m\]\u@\h(`date +%R`):\[\033[36m\]\w \[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '


#no annoying messages
unset MAILCHECK

# my git credentials, try to load it only for me
if [ -f $HOME/.git-credentials ]; then
    if [[ $USER =~ "karthik" ]] || [[ $USER =~ "katooru" ]]; then
        source $HOME/.git-credentials
    fi
fi

if [ -f $HOME/.ssh/config ]; then
    chmod 600 $HOME/.ssh/config
fi

# aliases
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# work related stuff
if [ -f $HOME/.bashrc_work ]; then
    source $HOME/.bashrc_work
fi
