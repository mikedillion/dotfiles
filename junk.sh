function dump {
  pbpaste >| "$@"
}

alias meh="echo '¯\_(ツ)_/¯' | tee >(pbcopy)"

# color
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2; tput bold)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)

function red() {
  echo -e "$RED$*$NORMAL"
}

function green() {
  echo -e "$GREEN$*$NORMAL"
}

function yellow() {
  echo -e "$YELLOW$*$NORMAL"
}

# toilet functions
function toilt() {
  toil0 what
  toil1 what
  toil2 what
  toil3 what
  toil4 what
  toil5 what
}
function toil0() { toilet --filter=border "$@" ;}
function toil1() { tput setaf 1 && toilet --font=smbraille "$@" ;}
function toil4() { tput setaf 2 && tput setab 6 && toilet --font=future "$@" ;}
function toil4() { tput setaf 2 && tput setab 6 && toilet --font=future "$@" ;}
function toil5() { tput setaf 1 && tput setab 6 && toilet --font=future "$@" ;}

function historyy {
  if [[ $# > 0 ]]; then
    history | cut -c 8- | sort | uniq | grep -i "$@"
  else
    history | cut -c 8- | sort | uniq
  fi
}

alias aliass='alias | grep -i "$@"'

alias here='basename $(pwd)'
