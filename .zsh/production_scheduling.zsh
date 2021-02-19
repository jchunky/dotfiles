export MESSAGE_BUS_CONSUMER_GROUP_ID=chunky

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
