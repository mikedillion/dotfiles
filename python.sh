export PYTHONSTARTUP="$HOME/.pythonrc"

if [ -e "/usr/local/bin/virtualenvwrapper.sh" ]; then
  source /usr/local/bin/virtualenvwrapper.sh
  export WORKON_HOME="$HOME/.python_envs"
fi

alias de="deactivate"
alias mkenv="mkvirtualenv $(basename $(pwd)) && workon $(basename $(pwd))"

alias pipp="pip install -r requirements.txt"
alias psi="python setup.py install"
