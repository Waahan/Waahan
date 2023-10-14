# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100

#Color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#Vim like keys
bindkey -v

#Load version control information
autoload -Uz vcs_info

#Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

updatePrompt()
{
    if [ "$vcs_info_msg_0_" = "" ]
        then
            PROMPT="%F{red}%n%f@%F{magenta}%m%f %F{blue}%~%f $ "
    else
            PROMPT="%F{red}%n%f@%F{magenta}%m%f %F{blue}%~%f %F{green}${vcs_info_msg_0_}%f $ "
    fi
}

precmd_functions+=(updatePrompt)

#red user @ magenta host blue pwd $
PROMPT="%F{red}%n%f@%F{magenta}%m%f %F{blue}%~%f $ "

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# End of lines added by compinstall
