#  ____              _ _       _           _            _
# |  _ \  ___  _ __ ( ) |_    (_)_   _  __| | __ _  ___| |
# | | | |/ _ \| '_ \|/| __|   | | | | |/ _` |/ _` |/ _ \ |
# | |_| | (_) | | | | | |_    | | |_| | (_| | (_| |  __/_|
# |____/ \___/|_| |_|  \__|  _/ |\__,_|\__,_|\__, |\___(_)
#                           |__/             |___/

export PYTHONSTARTUP="$HOME/.pythonrc"

# export PYTHONPATH="/usr/local/lib/python3.6/site-packages"
# export PYTHONHOME="/usr/local/opt/python/Frameworks/Python.framework/Versions/3.6/"

# export PYTHONPATH="/usr/local/lib/python3.7/site-packages"
# export PYTHONHOME="/usr/local/opt/python/Frameworks/Python.framework/Versions/3.7/"

# https://github.com/pyenv/pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

if [[ "$(uname)" == 'Darwin' ]]; then
  export PATH="/usr/local/opt/python@3.8/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
  export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"

  # export PATH="/usr/local/opt/python/libexec/bin:$PATH"
  # export PATH="$HOME/Library/Python/3.7/bin:$PATH"
  # export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
elif [[ "$(uname)" == 'Linux' ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# virtualenv stuff
########################################
export WORKON_HOME="$HOME/.python_envs"

if [[ "$(uname)" == 'Darwin' ]]; then
  export VIRTUALENVWRAPPER_PYTHON="/usr/local/opt/python@3.8/bin/python3"
  source /usr/local/bin/virtualenvwrapper.sh
elif [[ "$(uname)" == 'Linux' ]]; then
  export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
  source $HOME/.local/bin/virtualenvwrapper.sh
fi

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

# Make a virtual environment at the current location or tmux session
# and activate it
function mkvenv() {
  if [ $# -eq 0 ]; then
    # if [ -v TMUX ]; then # for bash > 4.2
    if [ -n "${TMUX+1}" ]; then
      env_name=$(tmux display-message -p '#S')
    else
      env_name=$(basename "$PWD")
    fi
  else
    env_name=$1
  fi
  mkvirtualenv $env_name
  workon $env_name
}

# Move a virtualenv
# usage: mvvenv desination_env
#        mvvenv source_env desination_env
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

# Implode a virtualenv
function impl() {
  local current_env=$(basename $VIRTUAL_ENV 2> /dev/null)
  deactivate
  rmvirtualenv $current_env
}

function pipp() {
  pip install -r requirements.txt
  if [ -f "requirements-dev.txt" ]; then
    pip install -r requirements-dev.txt
  fi
  if [ -f "requirements_dev.txt" ]; then
    pip install -r requirements_dev.txt
  fi
  if [ -f "setup.py" ]; then
    pip install -e .
  fi
}

alias pipf="pip freeze"
alias psi="python setup.py install"
alias psd="python setup.py develop"
alias psc="python setup.py clean"

# 99.9% useless and I'll never use this again ¯\_(ツ)_/¯
alias envdiff='diff <(lsvirtualenv) <(tmux list-sessions | cut -d ":" -f 2)'

# Anaconda
# export PATH="$PATH:/Users/miked/anaconda3/bin"
