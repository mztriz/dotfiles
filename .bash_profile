# .bash_profle for OS X 10.5 PPC 
# Ava Gailliot 

export PS1="\[\e[0;30m\]\u\[\e[m\] \[\e[0;34m\]\W\[\e[m\] \[\e[0;31m\] →\[\e[m\]"

export PATH=/usr/local/git/bin:$PATH
export MANPATH=/usr/local/git/man:$MANPATH
test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Macports and other paths
export BASH_CONF="bash_profile"
export PATH=/opt/local/bin:/opt/local/sbin:/opt/nginx/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# Web path
export CDPATH=/opt/nginx/html:$CDPATH
 

# Language support 
export LANG=ru_RU.UTF-8
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# Sexy Git and RVM promting 
function git-current-branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export PS1="\[\e[0;30m\][\[\e[m\]\[\e[0;31m\]\$(~/.rvm/bin/rvm-prompt v p g)\[\e[m\]\[\e[0;30m\]]\[\e[m\] $PS1 \$(git-current-branch) " # Shows version of RVM in use and git branch

# History
export HISTCONTROL=erasedups # Don't save duplicate lines
export HISTSIZE=1000
shopt -s histappend # Don't overwrite history

# History search his <term>
alias his='history | grep $1'

#Prettify all the outputs
CLICOLOR=1 # Enables color in the terminal bash shell export
LSCOLORS=gxfxcxdxbxegedabagacad # Sets up the color scheme for list export
export TERM=xterm-color # Enables color for iTerm
alias ls='ls -GF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m' # Begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # Begin bold
export LESS_TERMCAP_me=$'\E[0m' # End mode
export LESS_TERMCAP_se=$'\E[0m' # End standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m' # Begin
export LESS_TERMCAP_ue=$'\E[0m' # End underline
export LESS_TERMCAP_us=$'\E[01;32m' # Begin underline

alias nginx-stat='ps aux | grep nginx' # Nginx status
alias ip='ifconfig en3 | grep -w inet' # Internal ip addr
alias mac='ifconfig en3 | grep -w ether' # Mac address
alias cwd='pwd | pbcopy' # Copy current path
alias mount='mount | column -t' # Readable mount
alias can-has='sudo port install' # For the lulz

# Load RVM into a shell session 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
