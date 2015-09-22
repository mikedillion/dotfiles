# tmux
alias tmux="TERM=screen-256color-bce tmux"
[[ -s "$HOME/.tmuxifier/init.sh" ]] && source "$HOME/.tmuxifier/init.sh"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

source $HOME/bin/tmuxinator_completion

#complete -W "$(teamocil --list)" teamocil
alias tm="tmux"
alias tmls="tmux list-sessions"
alias tma="tmux attach -t"
alias tms="tmux switch -t"
alias tmk="tmux kill-session -t"

function tmns {
  if [[ $# -eq 1 ]]; then
    TMUX= tmux new-session -s "$1"
  elif [[ $# -eq 2 ]]; then
    TMUX= tmux new-session -s "$1" -c "$2"
  else
    TMUX= tmux new-session
  fi
}
