export VAGRANT_DEFAULT_PROVIDER='virtualbox'

alias vagrant='vagrant'
alias v='vagrant'
alias vu='vagrant up'
alias vp='vagrant provision'
alias vr='vagrant reload'
alias vs='vagrant suspend'
alias vgs='vagrant global-status'
alias vdf='vagrant destroy --force'
alias vdst='vagrant destroy --force'
alias vredo='vagrant destroy --force && vagrant up'
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

# https://github.com/hashicorp/terraform
export PATH=$PATH:/usr/local/terraform

# https://github.com/hashicorp/otto
export PATH=$PATH:/usr/local/otto

# packer
export PATH=$PATH:/usr/local/packer
export PACKER_CACHE_DIR=$HOME/.packer
