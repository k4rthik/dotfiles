alias d='date -d'
alias g='git'
alias s='ssh -A'
alias q='exit'
alias ls='ls -G'
alias ll='ls -al'
alias l='ls -a'
alias lss='ls -al | sort -k5nr'
alias grep='grep --color'
alias notes='cat $MY_HOME/.notes'

# Let sudo use these too
alias sudo="sudo "

#cron 
alias crr='sudo crontab'
alias crc='sudo crontab -u crontabs'

#history
alias his='history | grep'

#from bash-it
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'          # Go back

#emacs
case $OSTYPE in
  linux*)
    alias em='emacs'
    alias e='emacsclient -n'
    ;;
  darwin*)
    alias em='open -a emacs'
    alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
    ;;
esac

#hive
alias hls='mapred job -list | grep $USER'
alias hk='mapred job -kill'

if [ -f $HOME/.hive_completion ]; then
    HIVE_CLEAR='rlwrap -i --prompt-colour=green -f $HOME/.hive_completion -a'
    alias hv='$HIVE_CLEAR hive'

    HIVE_CLEAR_LOCAL='rlwrap -i --prompt-colour=yellow -f $HOME/.hive_completion -a'
    alias hvl='$HIVE_CLEAR_LOCAL hive -i  $HOME/.hiverc_local'
fi

#python
alias py='python'
alias ipy='py -m IPython'

alias pj='py -mjson.tool'

#perl
alias p='perl -MData::Dumper -E'
alias pp='perl -MData::Dumper -p -E'
alias pn='perl -MData::Dumper -n -E'

#brew
alias brup='brew update && brew upgrade'
alias brin='brew install'
alias brm='brew uninstall'
alias brls='brew list'
alias brs='brew search'

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en1'

# work related stuff
if [ -f $HOME/.bash_aliases_work ]; then
    source $HOME/.bash_aliases_work
fi
