# @production_scheduling_shell_config
export ESLINT_NO_DEV_ERRORS=true
export MESSAGE_BUS_CONSUMER_GROUP_ID=chunky

alias ps_cop='bundle exec rubocop -A'
alias ps_test='rake test:rspec'

function ps_reset {
  cd ~/src/production-scheduling/frontend
  nvm use
  yarn install
  cd ~/src/production-scheduling/backend
  chruby `cat .ruby-version`
  bundle
  bundle exec spring stop
  bundle exec rake db:reset
  bundle exec rake dev:reset_seed
  cd ..
}

function ps_update {
  cd ~/src/production-scheduling/frontend
  nvm use
  yarn install
  cd ~/src/production-scheduling/backend
  chruby `cat .ruby-version`
  bundle
  bundle exec spring stop
  bundle exec rake db:migrate db:test:prepare
  cd ..
}
