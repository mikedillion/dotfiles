[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# source $HOME/bin/go/go-bash-completion
complete -C /Users/miked/go/bin/gocomplete go
