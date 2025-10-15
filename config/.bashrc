# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Make some commands colourful
alias ls='ls --color=auto'
alias grep='grep --color=auto'

#Time formatting: day/month/year time
export HISTTIMEFORMAT="%d/%m/%y %T "

#Shell options
set -o vi # Use vi style editing
shopt -s dotglob # allow . files in globbing

#Auto complete 
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

#Colours
black='\[\033[01;30m\]' 
red='\[\033[01;31m\]'
green='\[\033[01;32m\]'
yellow='\[\033[01;33m\]'
blue='\[\033[01;34m\]'
purple='\[\033[01;35m\]'
cyan='\[\033[01;36m\]'
white='\[\033[01;37m\]'
reset='\[\033[00m\]'

#Prompt: (blue)user (purple)pwd (red)$
PS1=''${blue}'\u '${purple}'\w '${red}'$ '${reset}''
