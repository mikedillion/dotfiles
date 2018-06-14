export GREEN_HEART='💚\ '
export CYCLONE='🌀\ '
export CONSTRUCTION_SIGN='🚧\ '

#vcprompt -f "[%b]\033[0;31m%u\033[0m\033[0;32m%m\033[0m"
#export VCPROMPT_GIT_FORMAT="[%b]\033[0;31m%u\033[0m\033[0;32m%m\033[0m"
if [ $(uname) = "Darwin" ]; then
  export VCPROMPT_CHARS="--staged $GREEN_HEART --modified $CYCLONE --untracked $CONSTRUCTION_SIGN"
else
  export VCPROMPT_CHARS=""
fi

export VCPROMPT_GIT_FORMAT="[%b\|%r]%a%m%u"

alias vcprompt_git="vcprompt $VCPROMPT_CHARS -f $VCPROMPT_GIT_FORMAT"

export PS1='\[\033[0;33m\]\u\[\033[0m\]$WHITE_RIGHT_POINTING_BACKHAND_INDEX\[\033[0;32m\]\h\[\033[0m\]\[\033[0;34m\]\w\[\033[0m\]$(vcprompt_git)\n\$ '

