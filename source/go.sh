[[ -s "/Users/miked/.gvm/scripts/gvm" ]] && source "/Users/miked/.gvm/scripts/gvm"

source $HOME/bin/go/go-bash-completion

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

complete -C /Users/miked/go/bin/gocomplete go