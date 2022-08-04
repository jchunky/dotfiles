# NOTE: pyenv causes .bashrc to be loaded twice
# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

# uncrustify
# alias uncrustify_all='find . \( -name "*.cpp" -o -name "*.c" -o -name "*.h" \) -exec uncrustify -c ~/uncrustify.cfg --replace --no-backup {} +'

# chruby
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh

# ruby
# alias rb=ruby

# sublime
# alias st=subl
# alias stt='st ~/root/projects'

# bundler
# alias be='bundle exec'

# Make openssl available for ruby 2.3.1 compile
# export PATH="/usr/local/opt/openssl@1.0/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl@1.0/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.0/include"

# Make Zsh not store failed commands (https://superuser.com/questions/902241)
# zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# ncurses
#export PATH="/usr/local/opt/ncurses/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/ncurses/lib"
#export CPPFLAGS="-I/usr/local/opt/ncurses/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

# Used by 'bundler' zsh plugin [conflicts with DIRENV]
#BUNDLED_COMMANDS=(rails rubocop)

# bundler plugin [conflicts with DIRENV]
# richard plugin [obsolete]
#plugins=(bundler richard)

# export PROMPT='$([ "$RAILS_NEXT" == "true" ] && echo "(RAILS_NEXT) " || echo "")'"$PROMPT"
# export PROMPT='$([ "$DISABLE_SPRING" == "true" ] && echo "(DISABLE_SPRING) " || echo "")'"$PROMPT"
#export PROMPT="$(chruby_prompt_info) $PROMPT"

# nvm zsh plugin (does not work with homebrew install of nvm)
# plugins=(nvm $plugins)

# zsh_reload zsh plugin (unnecessarily complicated)
# plugins=(zsh_reload $plugins)

# nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# zsh-async
#source ~/.zsh-async/async.zsh

# icu4c (for yarn)
#export PATH="/usr/local/opt/icu4c/bin:$PATH"
#export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# autojump [never used]
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# direnv [breaks rvm; is broken by chruby; breaks script/rails_next_setup.sh]
#eval "$(direnv hook zsh)"

# fzf [too much jitter]
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rbenv [replaced by chruby]
#eval "$(rbenv init -)"

# update_all
#pushd ~/.zsh-async && git pull && popd

# Trap segfaults
#export SEGFAULT_SIGNALS="all"
#export SEGFAULT_SIGNALS="bus abrt"

# Disable flow control (enable Control+S to be sent to apps)
#stty -ixon
