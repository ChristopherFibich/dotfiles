#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



alias dotfiles="git --git-dir=$HOME/packages/dotfiles --work-tree=$HOME"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export EDITOR=nvim

source /usr/share/bash-completion/completions/git
__git_complete dotfiles __git_main
