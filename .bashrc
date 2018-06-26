TERM=xterm-256color
[[ $- == *i* ]] || return 0

kill -WINCH $$

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
export GREP_OPTIONS='--color=auto'
