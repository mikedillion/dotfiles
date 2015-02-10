# tmux
alias tmux="TERM=screen-256color-bce tmux"
[[ -s "$HOME/.tmuxifier/init.sh" ]] && source "$HOME/.tmuxifier/init.sh"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

source $HOME/bin/tmuxinator_completion

#complete -W "$(teamocil --list)" teamocil
alias tm='tmux'
alias tmls='tmux list-sessions'
alias tma='tmux attach -t'
alias tms='tmux switch -t'
alias tmk='tmux kill-session -t'
alias tmns='TMUX= tmux new-session'
