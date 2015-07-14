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
alias vagdel='rm -rf ~/.vagrant.d/data/machine-index/index*'

#  config.vm.synced_folder '/Users/miked/dotfiles', '/home/vagrant/dotfiles'
#  config.vm.synced_folder '/Users/miked/dotfiles_private', '/home/vagrant/dotfiles_private'
#  config.vm.synced_folder '/Users/miked/dotvim', '/home/vagrant/dotvim'

#  config.vm.provision 'shell' do |s|
#    s.privileged = false
#    s.inline = <<-CMD
#      source $HOME/dotfiles/README.md &&
#      source $HOME/dotfiles_private/README.md &&
#      source $HOME/dotvim/INSTALL
#    CMD
#  end
