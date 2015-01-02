#export PATH=$PATH:/opt/chefdk/bin
alias ce='chef exec'

alias apiup='curl https://supermarket.getchef.com/api/v1/health | jsonformat'

# kitchen.ci
alias kitchen='bundle exec kitchen'
alias k='kitchen'

alias kcr='kitchen create'
alias kdst='kitchen destroy'
alias kco='kitchen converge'
alias kver='kitchen verify'
alias klo='kitchen login'
alias kls='kitchen list'
function kredo {
  kitchen destroy "$@"
  kitchen converge "$@"
}

alias foodcritic='bundle exec foodcritic'
alias fcr='foodcritic'
