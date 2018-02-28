TERM=xterm-256color
[[ $- == *i* ]] || return 0

kill -WINCH $$
alias python=/bldmnt/toolchain/lin32/python-2.7.11-openssl1.0.1r/bin/python
