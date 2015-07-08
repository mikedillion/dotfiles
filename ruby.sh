# rbenv stuff, obvi
export PATH="$HOME/.rbenv/bin:$PATH"

type rbenv &> /dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
  source $HOME/.rbenv/completions/rbenv.bash
  alias rr='rbenv rehash'
fi

alias be='bundle exec'
alias fs='foreman start'

#function rake {
#  if [ -f Gemfile ]; then
#    bundle exec rake "$@"
#  else
#    rake "$@"
#  fi
#}

alias berks='bundle exec berks'
alias cap='bundle exec cap'
alias guard='bundle exec guard'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec'
alias rubocop='bundle exec rubocop'
alias thor='bundle exec thor'

alias rc='rubocop'
alias rct='rubocop --only Style/Tab'

alias jekyll='bundle exec jekyll'

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
