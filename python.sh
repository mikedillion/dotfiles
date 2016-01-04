export PYTHONSTARTUP="$HOME/.pythonrc"

# TODO(me!): Sort all this out later
#export VIRTUALENVWRAPPER_PYTHON=`which python`
#export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
#source `which virtualenvwrapper.sh`

#if [ -e "/usr/local/bin/pyenv" ]; then
#  export PYENV_ROOT="$HOME/.pyenv"
#  export PATH="$PYENV_ROOT/bin:$PATH"
#  eval "$(pyenv init -)"
#fi

if [ -e "/usr/local/bin/virtualenvwrapper.sh" ]; then
  source /usr/local/bin/virtualenvwrapper.sh
  export WORKON_HOME="$HOME/.python_envs"
fi

# virtualenv stuff
alias de="deactivate"

alias lsvirtualenv="lsvirtualenv -b"

#function workon() {
#  if [[ $# > 0 ]]; then
#    workon "$@"
#  else
#    local session=$(tmux display-message -p '#S')
#    workon "$session"
#  fi
#}

function mkvenv() {
  if [ $# -eq 0 ]; then
    # if [ -v TMUX ]; then # for bash > 4.2
    if [ -n "${TMUX+1}" ]; then
      env_name=$(tmux display-message -p '#S')
    else
      env_name=$(basename $(pwd))
    fi
  else
    env_name=$1
  fi
  mkvirtualenv $env_name
  workon $env_name
}

function mvvenv() {
  local current_env=$(basename $VIRTUAL_ENV 2> /dev/null)
  local source_env=$1
  local dest_env=$2

  if [[ $# -eq 1 ]]; then
    if [ -z "$current_env" ]; then
      echo "usage: mvvenv desination_env"
      echo "       mvvenv source_env desination_env"
      return 1
    else
      source_env=$current_env
      dest_env=$1
      deactivate
    fi
  fi

  cpvirtualenv $source_env $dest_env
  if [ $? -eq 0 ]; then
    rmvirtualenv $source_env
  else
    return 1
  fi

  if [ -z $current_env ]; then
    # copying puts you in the desitination env which is
    # undesireable if you're not currently in the source env
    deactivate
  fi
}

alias pipp="pip install -r requirements.txt"
alias psi="python setup.py install"

# 99.9% useless and I'll never use this again ¯\_(ツ)_/¯
alias envdiff='diff <(lsvirtualenv) <(tmux list-sessions | cut -d ":" -f 2)'
