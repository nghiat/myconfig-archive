export PATH="/bin:/usr/bin:$PATH";
export EDITOR="vim"
export PS1="\u:\w$ "

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Autocorrect typos when using cd
shopt -s cdspell;
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# Append history
shopt -s histappend
# Disable Ctrl-S
stty -ixon
