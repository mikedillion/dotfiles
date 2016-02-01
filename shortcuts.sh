alias d='diff'
alias e='echo'
alias c='cat'
alias weechat='/usr/local/Cellar/weechat/0.4.0/bin/weechat-curses'
alias l='ll'
alias ll='ls -alh'
alias ls='ls -1'
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias ssh_ls='sudo lsof -i -n | egrep "\<ssh\>"'
alias aa='ack -i -A 10 -B 10'

# fat fingers
alias cd..='cd ..'

# wat
alias dog='cat'

function remote_diff {
  diff <(ssh $1 "cat $2") <(ssh $3 "cat $4")
}

# SSH aliases
alias s="ssh"
alias ssh_cm="ln -sf ~/.ssh/config.cirrusmio ~/.ssh/config"
alias ssh_cmp="ln -sf ~/.ssh/config.cirrusmio.pem ~/.ssh/config"
alias ssh_p="ln -sf ~/.ssh/config.personal ~/.ssh/config"

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

alias tmcp='cat ~/durr/tmux | grep --color=never "panes on" | pbcopy' # stupid trick until you get this mapped
alias jsonformat='python -mjson.tool' # pretty print json
alias get='curl -O'
alias pbc='pbcopy'
alias pbp='pbpaste'

# tired of typing this
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

alias serve='python -m SimpleHTTPServer'

alias mou='open -a $HOME/Applications/Mou.app "$@"'

# Uh, you'll have to make this 'latest' symlink yourself.
alias oof='open -a /opt/homebrew-cask/Caskroom/openoffice/latest/OpenOffice.app/ "$@"'
