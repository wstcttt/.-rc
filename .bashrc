#create or attach the screen when start the shell
#if [[ -z "$STY" ]]; then
#    screen -xRR jun
#fi

TERM=xterm-256color
[[ $- == *i* ]] || return 0

kill -WINCH $$

if [ "$(uname)" == "Darwin" ]; then
    alias ls='ls -G'
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
else
    export LS_OPTIONS='--color=auto'
    eval "`dircolors`"
    alias ls='ls $LS_OPTIONS'
fi

export GREP_OPTIONS='--color=auto'
alias ..='cd ..'
alias ll='ls -al'

#####hack the rm#####
alias realrm=/bin/rm
alias rm=trash
alias rl='ls ~/.trash'
alias ur=untrash
trash()
{
    echo "------------"
    echo "This is not the real rm, no option needed"
    echo "You can recover file from ~/.trash, or just use: ur <file>"
    echo "Use the real /bin/rm to delete permanently, be careful!!!"
    echo "------------"
    mkdir -p ~/.trash
    mv $@ ~/.trash/ && echo "Done."
}
untrash()
{
    echo "Recover from ~/.trash, files: $@"
    for p in $*; do
        mv -i ~/.trash/$p .
    done
}
cleartrash()
{
    read -p "WARNING!!!:  Delete files in ~/.trash permanently, are you sure?[n]" confirm
    [[ $confirm == 'y' ]] || [[ $confirm == 'Y' ]]  && /bin/rm -rf ~/.trash/* && echo "All files cleared"
}
#####done of hack the rm#####

Blue='\033[34m'
Green='\033[32m'
Cyan='\033[36m'
Red='\033[31m'
Purple='\033[35m'
Brown='\033[33m'
STARTFGCOLOR=$Green
ENDCOLOR="\033[0m"
export PS1="\[$STARTFGCOLOR\][\t] \u@\h: \w \n\s-\v\$ \[$ENDCOLOR\]"

export LC_ALL=en_US.UTF-8

set -o vi

####functions####
function cprc() {
    scp ~/.bashrc ~/.vimrc ~/.screenrc ~/.inputrc $1:${2:-\~}/.
    ssh -t $1 "cd ${2:-~}"
}
