# Interactive non-login shell

# exports
PROMPT_COMMAND="date +%H%M"

# Silence pushd and popd
pushd() {
  command pushd "$@" > /dev/null
}
popd() {
  command popd "$@" > /dev/null
}
