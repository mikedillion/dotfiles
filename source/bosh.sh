#alias bosh='bundle exec bosh'
#alias bosh='bundle exec bosh -c ./.bosh_config '

#function bosh {
#  if [ -f Gemfile ]; then
#    bundle exec cap ./.bosh_config "$@"
#  else
#    bosh "$@"
#  fi
#}
