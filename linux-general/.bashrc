export PATH="/bin:/usr/bin:$PATH";
export EDITOR="vim"
export PS1="\[\e[1;30m\]\u:\w$ \[\e[0m\]"

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
