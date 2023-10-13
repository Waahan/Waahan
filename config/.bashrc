#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Make some commands colorful
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# reset colors [\033[00m\]
# blue \[\033[01;34m\]
# red \[\033[01;31m\]
# yellow \[\033[01;33m\]

#Prompt blue user yellow @ red host blue pwd red $ 
PS1='\[\033[01;34m\]\u\[\033[01;33m\]@\[\033[01;31m\]\H\[\033[01;31m\] \[\033[01;34m\]\W \[\033[01;31m\]\$ \[\033[00m\]'
