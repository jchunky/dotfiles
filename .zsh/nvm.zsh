##
# Run 'nvm use' automatically in a directory with a .nvmrc file
#
# Reference:
# https://github.com/creationix/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file
#
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use >/dev/null 2>/dev/null
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    nvm use default >/dev/null 2>/dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
