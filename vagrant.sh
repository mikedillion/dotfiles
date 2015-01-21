export VAGRANT_DEFAULT_PROVIDER='virtualbox'

alias vagrant='chef exec vagrant'
alias v='chef exec vagrant'
alias vu='chef exec vagrant up'
alias vp='chef exec vagrant provision'
alias vr='chef exec vagrant reload'
alias vs='chef exec vagrant suspend'
alias vgs='chef exec vagrant global-status'
alias vdf='chef exec vagrant destroy --force'
alias vdst='chef exec vagrant destroy --force'
alias vredo='chef exec vagrant destroy --force && chef exec vagrant up'
