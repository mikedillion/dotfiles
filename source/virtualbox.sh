function vms(){
  echo "Running:"
  VBoxManage list runningvms
  echo "ALL VMs:"
  VBoxManage list vms;
}

function vmpo(){
  VBoxManage controlvm "$@" poweroff
}

function vmunr(){
  VBoxManage unregistervm "$@"
}
