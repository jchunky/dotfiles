# @production_scheduling_shell_config
export ESLINT_NO_DEV_ERRORS=true
export MESSAGE_BUS_CONSUMER_GROUP_ID=chunky

export PS_DEV_FILTER_GEMS_FROM_BACKTRACE=true
export PS_DEV_SUPPRESS_RSPEC_FAILURE_DUMP=true

alias ps_cop='bundle exec rubocop -A'
alias ps_e2e='PORT=3031 VITE_APP_E2E_TEST_MODE="local" yarn run install-and-start'

function ps_reset {
  cd ~/src/production-scheduling/frontend
  nvm use
  yarn install
  cd ~/src/production-scheduling/backend
  chruby `cat .ruby-version`
  bundle
  bundle exec rake db:reset
  bundle exec rake dev:reset_seed
  cd ..
}

function ps_test {
  cd packmanager
  chruby `cat .ruby-version`
  RAILS_ENV=test be rails db:test:prepare db:seed
  cd backend
  chruby `cat .ruby-version`
  RAILS_ENV=test be rails db:test:prepare db:seed
  rake test:rspec
}

function ps_update {
  cd ~/src/production-scheduling/frontend
  nvm use
  yarn install
  cd ~/src/production-scheduling/backend
  chruby `cat .ruby-version`
  bundle
  bundle exec rake db:migrate db:test:prepare
  cd ..
}
