export PATH="/bin:/usr/bin:$PATH";
export EDITOR="vim"
export PS1="\[\e[1;30m\]\u:\w$ \[\e[0m\]"
export HISTSIZE=100000
export HISTFILESIZE=100000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

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
# Check the window size after each command and, if neccessary,
# update the value of LINES and COLUMNS
shopt -s checkwinsize

force_color_prompt=yes
