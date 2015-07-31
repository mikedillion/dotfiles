if [ -e "/usr/local/bin/virtualenvwrapper.sh" ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

alias act='source env/bin/activate'
alias de='deactivate'
alias newenv='virtualenv env && act'
alias pipp='pip install -r requirements.txt'
