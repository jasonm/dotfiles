# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=1000

export SAVEHIST=10000
export HISTFILE=~/.zsh_history

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# paths
export PATH=.:$PATH
export PATH=~/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# from `brew info docbook`
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# Setting up VirtualEnv[Wrapper], http://docwhat.org/2011/06/virtualenv-on-os-x/
# Commented out after 10.8 OSX upgrade since python maybe changed during 10.7.5 -> 10.8.2 upgrade
# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=''
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# export PIP_RESPECT_VIRTUALENV=true
#  
# if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
#     source /usr/local/bin/virtualenvwrapper.sh
# else
#     echo "WARNING: Can't find virtualenvwrapper.sh"
# fi

export JAVA_HOME="$(/usr/libexec/java_home)"

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# idk use a plugin manager or something someday jeez
source ~/.zsh/plugins/zle_vi_visual.zsh

# how you like me now, rails startup time
rails_migration() {
  filename="db/migrate/`date +%Y%m%d%H%M%S`_$1.rb"
  classname=$(ruby -e "puts '$1'.split('_').map{|e| e.capitalize}.join")
  touch $filename
  echo "class $classname < ActiveRecord::Migration" >> $filename
  echo "  def self.up"                              >> $filename
  echo "  end"                                      >> $filename
  echo ""                                           >> $filename
  echo "  def self.down"                            >> $filename
  echo "  end"                                      >> $filename
  echo "end"                                        >> $filename
}

export PATH=$PATH:$HOME/dev/storm/distro/storm-0.8.1/bin

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
