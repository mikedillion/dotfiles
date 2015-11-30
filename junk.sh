function dump {
  pbpaste >| "$@"
}

alias meh="echo '¯\_(ツ)_/¯' | tee >(pbcopy)"
alias flipout="echo '(╯°□°）╯︵ ┻━┻' | tee >(pbcopy)"

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
alias funcf='typeset -F | grep -C 10 -i "$@"'

alias here='basename $(pwd)'

# meh
function ak() {
  awk "{print \$$@}"
}

# Rainbows
# yes "$(seq 232 255;seq 254 -1 233)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .01; don]"
alias rainbow='yes "$(seq 1 255)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .01; done'

# Serpent stuff
#alias snake_case="tr -c '[[:alnum:]] ' '_' | tr ' ' '_' | tr -s '\n'"
alias snake_case="tr -cd '[[:alnum:]] ' | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -s '\n'"
alias snake_paste="pbpaste | snake_case"

# https://gist.github.com/kenkeiter/65be229609f4dc0d92cc
# https://gist.github.com/beng/806b8420cc16bcf8a07a
selfie(){
  local selfie_archive_path="$HOME/selfie"
  local datestamp=$(date +%y%m%d%H%M%S)
  local filepath="$selfie_archive_path/$datestamp.png"

  mkdir -p $selfie_archive_path   # make the selfie folder if it doesn't exist
  imagesnap $filepath -w 1.0      # the -w flag gives the camera time to warm up
  # impbcopy $filepath            # copy the data for the image to the clipboard
  local link=$(imguru -d $filepath 2>&1) # upload to Imgur
  echo $link | tee >(pbcopy)      # display the link and copy it to clipboard
  echo "$datestamp,$filepath,$link" >> $selfie_archive_path/LOGFILE
}
