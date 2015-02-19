# http://unix.stackexchange.com/questions/4290/aliasing-cd-to-pushd-is-it-a-good-idea

pushd() {
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

pushd_builtin() {
  builtin pushd > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

popd() {
  builtin popd > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'
