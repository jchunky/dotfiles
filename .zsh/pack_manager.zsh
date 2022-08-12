# @pack_manager_shell_config
export QUEUE=*
export NGINX_PORT=3000
export UNICORN_PORT=5555
# foreman sometimes fails to start
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# silence thor deprecation warnings when running rake tasks
export THOR_SILENCE_DEPRECATION=true

alias bg1='be rake resque:scheduler'
alias bg2='QUEUE=* bundle exec rake resque:work'
alias fr='pm_kill; foreman start'
alias frs='pm_kill; rails s'
alias fra='pm_kill; foreman start -f Procfile.all'
alias frmrp='pm_kill; foreman start -f Procfile.mrp'
alias frn='pm_kill; RAILS_NEXT=true foreman start'
alias fran='pm_kill; RAILS_NEXT=true foreman start -f Procfile.all'
alias i18n='bundle exec rake i18n:js:extract'
alias jstest='npm test'
alias ks='kill_all_phantomjs; n karma start --browsers=PhantomJS'
alias pm_clean='n gulp clean; rm -rf client/bower_components; rm -rf node_modules; rm -rf public/assets; rm -rf public/client/bower_components'
alias pm_cop='thor nucop:cli:diff_enforced --auto-correct'
alias pm_db_update='bundle exec rake db:migrate db:test:update;'
alias pm_help='alias |grep pm_'
alias pm_kill='kill_processes_listening_on 3000; kill_processes_listening_on 5500; kill_processes_listening_on 5555; pkill -9 -i -f nginx; pkill -9 -i -f unicorn; pkill -9 -i -f node;'
alias pm_merge='thor nugit:integrate'
alias pm_reset='bundle; rails db:reset; pmu; pm_user'
alias pm_seed1='rake nulogy:tdc:candy_pack:schedule:fs_variety_mix'
alias pm_seed2='rake nulogy:tdc:dane_post:schedule:fs_variety_mix'
alias pm_update='bundle; pmu'
alias rn='RAILS_NEXT=true '

function kill_all_phantomjs() { pkill -9 -i -f phantomjs }
function kill_processes_listening_on() { lsof -i:$1 -t | xargs kill; }
function n() { node_modules/.bin/$@ ;}
function kmobile() { kill_all_phantomjs; `pwd`/node_modules/.bin/karma start karma.mobile.conf.js --browsers=PhantomJS }
function kdesktop() { kill_all_phantomjs; `pwd`/node_modules/.bin/karma start karma.conf.js --browsers=PhantomJS }
function nucop { be thor nucop:diff --added-only && be thor nucop:diff_enforced }
function rubocorrect() { rubocop $1 --config .rubocop.backlog.yml -a --only=$2 }
function ruboffenses() { rubocop $1 --config .rubocop.backlog.yml --format offenses }
function rubofile() { rubocop $1 --config .rubocop.backlog.yml }
function reset_rails_db {
  be rake db:drop
  be rake db:create
  be rake db:schema:load
  be rake db:migrate
  be rake db:seed
  be rake db:test:prepare
}
function reset_rails_db_pm {
  be rake db:drop
  be rake db:create
  be rake db:schema:load
  be rake db:migrate
  be rake db:seed
  be rake db:test:update
}
