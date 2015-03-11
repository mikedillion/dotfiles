# git completion
source $HOME/bin/git/git-completion.bash
# complete -o default -o nospace -F _git_checkout gco

#export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -fg '
export PATH=$PATH:$HOME/bin/git

# functions
################################################################################
function g {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    git status --short --branch --ignored
  fi
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo -e "\033[0;31m+\033[0m"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]$(parse_git_dirty)/"
}

function git-branch-by-date {
  for k in `git branch | sed s/^..//`; do
    echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";
  done | sort
}

function git-branch-by-date-remote {
  for k in `git branch -r | sed s/^..//`; do
    echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";
  done | sort
}

function git-branch-all {
  for dir in *; do
    if [ -d "$dir/.git" ]; then
      pushd $dir;
        git-branch-status;
      popd;
    fi
  done
}

function gpr {
  git push origin
  hub pull-request --browse --message "$@"
}

function gco {
  if [[ $# > 0 ]]; then
    git checkout "$@"
  else
    git checkout @{-1}
  fi
}

function gciam {
  if [[ $# > 0 ]]; then
    git commit --all --message "$@"
  else
    red You just make an empty commit with:
    git commit -a --allow-empty-message -m ''
    git show --minimal
  fi
}

# git ahead_behind
# TODO make this less awful
function ahead_behind {
  git status &> /dev/null
  if [ $? -eq 0 ]; then
    curr_branch=$(git rev-parse --abbrev-ref HEAD);
    curr_remote=$(git config branch.$curr_branch.remote);
    curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
    ab=$(git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | tr -s '\t' '|';)
    echo -e "[$ab]"
  fi
}

# github url shortener
function gshrt {
  url=$1
  curl -si http://git.io -F "url=$url" | grep "Location" | cut -d ' ' -f 2
}

# git aliases
################################################################################

# From gitconfig:
#  br = branch
#  ci = commit
#  cl = clone
#  co = checkout
#  di = diff
#  ls = status
#  pl = pull
#  pom = push origin master
#  pu = push
#  r = reset
#  rb = rebase
#  rl = reflog
#  st = status
#
alias git='hub'
alias ga='git add'
alias gap='git add --patch'
alias gapg='git add --patch `gus`'
alias gb='git browse'
alias gbr='git branch -vv'
alias gbrs='git-branch-status'
alias gci='git commit'
alias gcia='git commit --all'
alias gcim='git commit --message'
alias gcl='git clone'
alias gcb='git checkout -b $(basename $PWD)'
alias gdi='git diff'
alias gdin='git diff --name-only'
alias gdis='git diff --staged'
alias gdit='git difftool'
alias gdits='git difftool --staged'
alias gp='git pull'
alias gpo='git push -u origin'
alias gpogb='git push -u origin && git browse'
alias gpu='git push'
alias gr='git reset'
alias grb='git rebase'
alias grbm='git rebase master'
alias grbim='git rebase --interactive master'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grl='git reflog'

alias ff='git status --ignored'
alias gg='git status --ignored --short'

alias ss='git_find_n_short_status'
alias qq='git_find_n_short_status'

alias find_repos='find . -type d -name .git'

alias grms='git remote -v show'

alias gundl='git ls-files -d | xargs git checkout --'

alias grrr='git reset HEAD --hard'

# hub specific
alias gcist='hub ci-status'

# quickly open those things you're working
################################################################################
alias gst='git diff --staged --name-only' # list of files staged
alias vgst='vi -O $(gst)'

alias gus='git ls-files --modified' # list of files not staged
alias vgus='vi -O $(gus)'

alias gut='git ls-files --others --exclude-standard' # list of untracked files
alias vgut='vi -O $(gut)'

alias gum='git ls-files --unmerged | awk "{print \$4}" | uniq' # list of unmerged
alias vgum='vi -O $(gum)'

alias git_contrib='git shortlog -s -n'

alias git_start='git init . && git add . && git commit --all --message "Initial commit"'

git_commit_diff='git log --left-right --graph --cherry-pick --oneline master..'
alias gcd='git_commit_diff'

# Experimental
################################################################################

alias snake_case="tr -cd '[[:alnum:]] ' | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -s '\n'"

function 1off {
  export CURRENT_FEATURE="$@"
  echo "Starting work on '$CURRENT_FEATURE'"
  git checkout -b $(echo $CURRENT_FEATURE | snake_case)
}

function 1done {
  local current_branch=$(git symbolic-ref --short HEAD)
  git commit --all --message "$CURRENT_FEATURE"
  git push -u origin $current_branch
  #git branch --set-upstream-to=origin/$current_branch $current_branch
  hub pull-request --browse --message "$CURRENT_FEATURE"
}
