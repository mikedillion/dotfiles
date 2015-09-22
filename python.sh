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

alias de="deactivate"
function mkenv() {
  local current_dir=$(basename $(pwd))
  mkvirtualenv $current_dir
  workon $current_dir
}

alias pipp="pip install -r requirements.txt"
alias psi="python setup.py install"
