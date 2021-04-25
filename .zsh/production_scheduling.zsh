export ESLINT_NO_DEV_ERRORS=true
export MESSAGE_BUS_CONSUMER_GROUP_ID=chunky

alias ps_test='rake test:rspec'

function ps_update {
  cd ~/src/production-scheduling/frontend
  yarn install
  cd ~/src/production-scheduling/backend
  chruby `cat .ruby-version`
  bundle
  bundle exec rake db:schema:load
  bundle exec rake dev:reset_seed
  cd ..
}
