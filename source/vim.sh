if [[ "$(uname)" == 'Darwin' ]]; then
  # alias vim="/usr/local/Cellar/vim/latest/bin/vim"

  # alias vi="/usr/bin/vim"
  # alias vi="/usr/local/bin/vim"

  alias vi="/Applications/MacVim.app/Contents/bin/vim"
  alias vim="/Applications/MacVim.app/Contents/bin/vim"
  export PATH="$PATH:/Applications/MacVim.app/Contents/bin/"
elif [[ "$(uname)" == 'Linux' ]]; then
  alias vi="/usr/bin/vim"
fi

alias vi=vim

alias vc=vimcat
alias sp='vi -o' # open in horizontal splits
alias vsp='vi -O' # open in vertical splits
alias vip='vi -p' # open in tabs

alias vdi='vimdiff'

#function vi {
#  if jobs | grep -i vim; then
#    toilet --font=smbraille "Foregrounding current session"
#    sleep 1
#    fg
#  else
#    vim $@
#  fi
#}
