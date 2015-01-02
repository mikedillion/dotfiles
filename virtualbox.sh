function vms(){
  tput setaf 0 && tput setab 6 && echo "Running:" && tput reset;
  VBoxManage list runningvms
  tput setaf 0 && tput setab 6 && echo "ALL VMs:" && tput reset;
  VBoxManage list vms;
}

function vmpo(){
  VBoxManage controlvm "$@" poweroff
}

function vmunr(){
  VBoxManage unregistervm "$@"
}

function vmdel(){
  rm -rf "$HOME/VirtualBox\ VMs/$@"
}
