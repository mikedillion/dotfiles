alias d='diff'
alias e='echo'
alias c='cat'
alias weechat='/usr/local/Cellar/weechat/current/bin/weechat-curses'
alias l='ll'
alias ll='ls -alh'
alias ls='ls -1'
# alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias ssh_ls='sudo lsof -i -n | egrep "\<ssh\>"'
alias aa='ack -i -A 10 -B 10'

# fat fingers
alias cd..='cd ..'

# wat
alias dog='cat'

function remote_diff {
  diff <(ssh $1 "cat $2") <(ssh $3 "cat $4")
}

function j {
    if [[ $# > 0 ]]; then
        fg "$@"
    else
        jobs
    fi
}

alias j1='j 1'
alias j2='j 2'
alias j3='j 3'

function o {
  if [[ $# > 0 ]]; then
    open "$@"
  else
    open .
  fi
}

function img {
  for image in "$@"; do
    convert -thumbnail $(tput cols) "$image" txt:- | \
      awk -F '[)(,]' '!/^#/{gsub(/ /,"");printf"\033[48;2;"$3";"$4";"$5"m "}';
    echo -e "\e[0;0m";
  done;
}

alias jsonformat='python -mjson.tool' # pretty print json
alias get='curl -O'
alias pbc='pbcopy'
alias pbp='pbpaste'

# tired of typing this
# 2019 update: I have no idea what this is for.
function just {
  if [[ $# > 1 ]]; then
    LINES="$1"
    shift
    grep --color=never -A $LINES "$@"
  else
    grep --color=never -A 1 "$1"
  fi
}

# open files with chrome? do more with this
function ogc {
  # --args --disable-web-security
  open -a Google\ Chrome $1
}

alias oo='ogc'

function ack_ {
  pattern=$1
  shift
  vim +"Ack '$pattern' $*"
}

function md {
  mkdir -p "$*" && cd "$*"
}

function thin {
  bundle exec thin start -p $@
}

alias dnv='ln -sf dotenv.development .env'

function to_s {
  ruby -e "puts gets.downcase.gsub(/[^0-9a-z]/i, '_')"
}

# arbitrary command output colourer
alias color='acoc'

function findd {
  find . -type d -iname "*$@*"
}

function findf {
  find . -type f -iname "*$@*"
}

alias telnet_nyan='telnet nyancat.dakko.us'

# alias serve='python -m SimpleHTTPServer'
# alias serve='ruby -run -e httpd . -p 8000'
alias serve='python3 -m http.server'

# Markdown tools on command line
alias mo='open -a /Applications/Markoff.app "$@"'
alias mt='open -a /Applications/Mark\ Text.app "$@"'
alias mou='open -a /Applications/Mou.app "$@"'
alias macd='open -a /Applications/MacDown.app "$@"'
alias twig='open -a /Applications/Twig.app "$@"'

alias jnv='open -a /Applications/Jupyter\ Notebook\ Viewer.app "$@"'
alias oof='open -a /Applications/OpenOffice.app "$@"'

# My fingers have always thought that this should be a thing:
alias chmox="chmod +x"

ytadl() {
  # brew install AtomicParsley and the thumbnail part will actuall work!
  youtube-dl --ignore-errors --verbose --embed-thumbnail --audio-quality 0 --no-overwrite \
  --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s" "$@"
}

alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I ncurses"

alias ddate="date +%Y%m%d"
alias logdate="date +%Y%m%dT%H%M%S"
alias dt="ddate"
alias dtt="logdate"

if [[ "$(uname)" == 'Linux' ]]; then
  alias ack="ack-grep"
fi

function sha256sum() {
  shasum -a 256 "$@" ;
}

function sha512sum() {
  shasum -a 512 "$@" ;
}

alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport"

function jqp() {
  pbpaste | jq '.'
}

# Quick hd capacity. At least on simple macosx...
function capa() {
  df -h | head -n 2 | tail -n 1 | awk '{print $5}'
}
