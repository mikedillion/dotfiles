function vms(){
  echo "Running:"
  VBoxManage list runningvms
  echo "ALL VMs:"
  VBoxManage list vms | cut -d ' ' -f 1
}

function vmp(){
  VBoxManage controlvm "$@" pause
}

function vmr(){
  VBoxManage controlvm "$@" resume
}

function vmpo(){
  VBoxManage controlvm "$@" poweroff
}

function vmunr(){
  VBoxManage unregistervm "$@"
}
