# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export GEM_HOME=$(ruby -e 'puts Gem.user_dir')
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

[ ! "$UID" = "0" ] && archbey2

source $ZSH/oh-my-zsh.sh

alias ls="ls -F --color"

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/
mztriz/.config/bspwm/panel/panel:/home/mztriz/.cofig/bspwm/panel/panel_bar:/home/mz
triz/.gem/ruby/2.1.0/bin:/opt/cc0/bin
