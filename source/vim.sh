
if [[ "$(uname)" == 'Darwin' ]]; then
  export PATH="$PATH:/Applications/MacVim.app/Contents/bin/"
  # alias vi="/usr/local/bin/vim"
  alias vi="/Applications/MacVim.app/Contents/bin/vim"
elif [[ "$(uname)" == 'Linux' ]]; then
  alias vi="/usr/bin/vim"
fi

alias gi='vi' # fat fingers
alias mvi='mvim' # MacVim

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
