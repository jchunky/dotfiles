# Interactive non-login shell

# exports
PROMPT_COMMAND="date +%H%M"

# homebrew
export HOMEBREW_NO_ENV_HINTS=true
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# nvm
export NVM_DIR="$HOME/.nvm"

# @production_scheduling_shell_config
export ESLINT_NO_DEV_ERRORS=true
export MESSAGE_BUS_CONSUMER_GROUP_ID=chunky

# @pack_manager_shell_config
export QUEUE=*
export NGINX_PORT=3000
export UNICORN_PORT=5555
# foreman sometimes fails to start
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# silence thor deprecation warnings when running rake tasks
export THOR_SILENCE_DEPRECATION=true

# Silence pushd and popd
pushd() {
  command pushd "$@" > /dev/null
}
popd() {
  command popd "$@" > /dev/null
}
