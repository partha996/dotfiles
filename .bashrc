#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export DISPLAY=:0

eval "$(starship init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Completely replace cd with zoxide
eval "$(zoxide init --cmd cd bash)"

