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

function mkvenv() {
  local current_dir=$(basename $(pwd))
  mkvirtualenv $current_dir
  workon $current_dir
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
    # copying puts you in the desitination env, undesireable if not starting
    # from the source
    deactivate
  fi
}

alias pipp="pip install -r requirements.txt"
alias psi="python setup.py install"
