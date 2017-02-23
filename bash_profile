# from Minerva
ulimit -n 1024
export PATH=/usr/local/bin:$PATH
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT="true"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# No pyc
export PYTHONDONTWRITEBYTECODE=True

source ~/.minerva_bash_completions.sh

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
bind '\C-a:beginning-of-line'
bind '\C-e:end-of-line'
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

# Include time of previous command in PS1
# http://stackoverflow.com/questions/1862510/how-can-the-last-commands-wall-time-be-put-in-the-bash-prompt
function timer_start {
  timer=${timer:-$SECONDS}
}
function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}
trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop
PS1_TIMER='${timer_show}s '

export PS1=$PS1_TIMER$IBlack$Color_Off'$(git branch &>/dev/null;\
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

killport() { lsof -i :$1 | grep -v PID | cut -d" " -f2|xargs kill; }

# turn off flow control, mapped to ctrl-s, so that we regain use of that key
# for searching command line history forwards (opposite of ctrl-r)
stty -ixon

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=~/bin:~/bin/shared:$PATH

export GOPATH=~/dev/gopath

source ~/.auto_venv

# brew info awscli
complete -C aws_completer aws


# rando schools stuff to do it live
# export RSA_KEY_2015_FILENAME=rsa_key_2015_production.pub

# brew info pyenv
if which pyenv > /dev/null; then
  echo shout > /dev/null
  # eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi

# From Arthur
touchd() {
    for p in "$@"; do
        _dir="$(dirname -- "$p")"
        [ -d "$_dir" ] || mkdir -p -- "$_dir"
        touch -- "$p"
    done
}
