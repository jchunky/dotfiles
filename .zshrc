# zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT=true
plugins=(bundler chruby git gitfast history nulogy ruby sublime timer $plugins)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt pushdsilent

# Exports
export BASH_ENV="~/.bashrc"
export EDITOR='subl -w'
export PATH=.:./bin:~/.bin:~/root/projects/private/.bin:$PATH
export PATH="/usr/local/sbin:$PATH" # Homebrew

# Disable when running PackManager translation scripts
export CDPATH=~/root:~/root/bands:~/root/projects/exercism/ruby:~/root/projects/katas:~/root/projects:~/src/production-scheduling:~/src/packmanager:~/src

# Disable spring preloader
export DISABLE_SPRING=true

# homebrew
export PATH=/usr/local/bin:$PATH

# gettext (PackManager translations)
export PATH=/usr/local/opt/gettext/bin:$PATH

# PackManager (foreman sometimes fails to start)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# PackManager (silence thor deprecation warnings when runninng rake tasks)
export THOR_SILENCE_DEPRECATION=true

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-you-should-use
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh

# Aliases
alias a='alias | grep -i'
alias permit_chromedriver='xattr -d com.apple.quarantine $(which chromedriver)'
alias brewdeps='brew leaves | xargs brew deps --installed --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"'
alias brewdump='pushd ~/root/projects/dotfiles && brew bundle dump --force && popd'
alias cheat='cat ~/root/projects/private/docs/cheat.txt'
alias chrspec='CAPYBARA_DRIVER=chrome bundle exec rspec'
alias cop='rubocop -a'
alias daily='update_all; daily_ruby_tasks'
alias delete_local_branches='git branch | grep -v \* | xargs git branch -D'
alias dco='docker-compose'
alias git_set_head='git remote set-head origin -a'
alias gitb="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"
alias grep='grep -a'
alias src='source ~/.zshrc'
alias stp='st ~/root/projects'
alias stow_dotfiles='stow --dir=$HOME/root/projects --target=$HOME dotfiles'
alias stow_dotfiles_delete='stow -D --dir=$HOME/root/projects --target=$HOME dotfiles'
alias trello=nutrella

# Git
alias gd='git diff -b'
alias gdca='git diff -b --cached'
alias gdcw='git diff -b --cached --word-diff'
alias gds='git diff -b --staged'
alias gdw='git diff -b --word-diff'

# Functions
function brupdate { brew update; brew upgrade; brew cleanup; brew doctor; }
function mkpr {
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD);
  hub pull-request -m "${BRANCH_NAME}"
}
function update_all {
  tldr --update

  brewdump
  brew update -q
  brew upgrade -q
  brew cleanup -q
  brew upgrade -q --cask

  pushd ~/.oh-my-zsh-custom && git pull && popd
  pushd ~/root/third_party/dev-toolbox && git pull && popd

  pushd ~/src/production-scheduling && git fetch -p && delete_stale_branches && popd
  pushd ~/src/packmanager && git fetch -p && delete_stale_branches && popd

  pushd ~/root/projects/private && gaa && gcmsg "auto-update"; gp && popd
}
function update_gems {
  gem update --system
  gem install bundler byebug flog foreman guard interactive_editor nutrella pony pry rake rspec rubocop sinatra unicorn whats_up
  gem update  bundler byebug flog foreman guard interactive_editor nutrella pony pry rake rspec rubocop sinatra unicorn whats_up
}

# Public zsh files
for dotfile in ~/.zsh/*.zsh; do
  source "$dotfile"
done

# Private zsh files
for dotfile in ~/root/projects/private/.zsh/*.zsh; do
  source "$dotfile"
done
