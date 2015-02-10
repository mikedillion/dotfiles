alias rails='bundle exec rails'

alias dbm='rake db:migrate'
alias dbs='rake db:seed'
alias dbdc='rake db:drop db:create'
alias dbms='rake db:schema:load db:migrate db:seed'
alias dbr='dbdc && dbms'

function rails_start() {
  rails new $1
  pushd $1
  git init .
  git add .
  git commit --all --message "Initial commit"
  popd $1
}

alias whatev='\rails new whatever'
