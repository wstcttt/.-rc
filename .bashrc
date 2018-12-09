TERM=xterm-256color
[[ $- == *i* ]] || return 0

kill -WINCH $$
#alias python=/bldmnt/toolchain/lin32/python-2.7.11-openssl1.0.1r/bin/python

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
export GREP_OPTIONS='--color=auto'
alias ..='cd ..'
alias ll='ls -alt'

Blue='\033[34m'
Green='\033[32m'
Cyan='\033[36m'
Red='\033[31m'
Purple='\033[35m'
Brown='\033[33m'
STARTFGCOLOR=$Green
ENDCOLOR="\033[0m"
export PS1="$STARTFGCOLOR[\t] \u@\h: \w \n\s-\v\$ $ENDCOLOR"

set -o vi

#perforce
export P4PORT=perforce.eng.vmware.com:1666
export P4USER=tjun
export P4IGNORE=.p4ignore
