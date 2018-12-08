TERM=xterm-256color
[[ $- == *i* ]] || return 0

kill -WINCH $$
#alias python=/bldmnt/toolchain/lin32/python-2.7.11-openssl1.0.1r/bin/python

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
export GREP_OPTIONS='--color=auto'

set -o vi

#perforce
export P4PORT=perforce.eng.vmware.com:1666
export P4USER=tjun
export P4IGNORE=.p4ignore
