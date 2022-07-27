# Non-interactive shell

# exports
PROMPT_COMMAND="date +%H%M"

# homebrew
export HOMEBREW_NO_ENV_HINTS=true
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Silence pushd and popd
pushd() {
  command pushd "$@" > /dev/null
}
popd() {
  command popd "$@" > /dev/null
}

# production-scheduling
export ESLINT_NO_DEV_ERRORS=true
export MESSAGE_BUS_CONSUMER_GROUP_ID=chunky

# PackManager
export QUEUE=*
export NGINX_PORT=3000
export UNICORN_PORT=5555
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export THOR_SILENCE_DEPRECATION=true
