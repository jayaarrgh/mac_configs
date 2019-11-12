## My BASHRC 
# allows us to Ctrl-S in VIM without locking the terminal
stty -ixon

alias l="ls"
alias ll="ls -laFs"
alias la="ls -a"
alias cls="clear"
alias ipy="ipython3"
alias v="vim"
alias vn="vim --noplugin"


export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
