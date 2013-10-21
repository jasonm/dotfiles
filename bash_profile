# from Minerva
ulimit -n 1024
export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT="true"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
export PATH=$PATH:node_modules/.bin

# from Jason
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

set -o vi
export PATH=~/bin:$PATH
export EDITOR=/usr/bin/vim
if [ -e "$HOME/.aliases" ]; then source "$HOME/.aliases"; fi
export HISTSIZE=1500

export LESS=-R
export LESSOPEN="|~/bin/lesspipe.sh %s"

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# From http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Blue="\[\033[0;34m\]"
Purple="\[\033[0;35m\]"
Cyan="\[\033[0;36m\]"
White="\[\033[0;37m\]"

# High Intensty
IBlack="\[\033[0;90m\]"
IRed="\[\033[0;91m\]"
IGreen="\[\033[0;92m\]"
IYellow="\[\033[0;93m\]"
IBlue="\[\033[0;94m\]"
IPurple="\[\033[0;95m\]"
ICyan="\[\033[0;96m\]"
IWhite="\[\033[0;97m\]"

# Various variables you might want for your PS1 prompt instead
PathShort="\w"


export PS1=$IBlack$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 "(%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$Yellow'"$(__git_ps1 "[%s]"); \
  fi) '$Green$PathShort$Color_Off' \$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Green$PathShort$Color_Off' \$ "; \
fi)'
