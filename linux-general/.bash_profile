#
# ~/.bash_profile
#

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 && -x "$(command -v startx)" ]]; then
  exec startx
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
