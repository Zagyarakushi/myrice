#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

PS1="\[\e[1;33m\][\[\e[m\]\[\e[1;33m\]\u\[\e[m\]\[\e[1;33m\]]\[\e[m\]\[\e[1;34m\][\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;34m\]]\[\e[m\]\[\e[1;31m\]-\[\e[m\]\[\e[1;31m\]>\[\e[m\] "

export QT_XCB_GL_INTEGRATION=none

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shroudedsublet/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shroudedsublet/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shroudedsublet/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shroudedsublet/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

