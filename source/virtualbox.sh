# https://www.virtualbox.org/manual/ch08.html
# https://blog.scottlowe.org/2016/11/10/intro-to-vbox-cli/

function vmls(){
  echo "Running:"
  VBoxManage list runningvms
  echo "ALL VMs:"
  VBoxManage list vms | cut -d ' ' -f 1
}

function vms(){
  VBoxManage startvm "$@" --type headless
}

function vmpo(){
  VBoxManage controlvm "$@" poweroff
}

function vmr(){
  VBoxManage controlvm "$@" resume
}

function vmp(){
  VBoxManage controlvm "$@" pause
}

function vmunr(){
  VBoxManage unregistervm "$@"
}
