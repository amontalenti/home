# bashrc is used for non-interactive shells
#
# this means bashrc should include things like aliases and functions
# whereas bash_profile should include customizations to the interactive
# shell, including exported variables.

# If not running interactively, don't do anything
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -f ~/.bash_prompt ] && . ~/.bash_prompt

[ -f ~/.bash_functions ] && . ~/.bash_functions

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

[ -f ~/.bash_env ] && . ~/.bash_env

[ -f ~/.bash_completion ] && . ~/.bash_completion

[ -f /etc/bash_completion ] && . /etc/bash_completion
