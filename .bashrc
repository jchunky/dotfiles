# Interactive non-login shell

# exports
export PROMPT_COMMAND="date +%H%M"
export BASH_SILENCE_DEPRECATION_WARNING=1

# Silence pushd and popd
pushd() {
  command pushd "$@" > /dev/null
}
popd() {
  command popd "$@" > /dev/null
}

#source /Users/jasonc/.docker/init-bash.sh || true # Added by Docker Desktop
