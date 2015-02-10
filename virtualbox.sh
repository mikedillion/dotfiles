function vms(){
  VBoxManage list runningvms
  VBoxManage list vms;
}

function vmpo(){
  VBoxManage controlvm "$@" poweroff
}

function vmunr(){
  VBoxManage unregistervm "$@"
}
