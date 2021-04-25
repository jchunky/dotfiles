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

# exports
export BASH_ENV="~/.bashrc"
export EDITOR='subl -w'
export PATH=.:./bin:~/.bin:~/root/projects/private/.bin:$PATH

# cdpath
export CDPATH=~/root:~/root/projects/exercism/ruby:~/root/projects/katas:~/root/projects/katas/_archive:~/root/projects/katas/_javascript:~/root/projects:~/src/production-scheduling:~/src/packmanager:~/src

# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-you-should-use
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh

# Aliases
alias a='alias | grep -i'
alias permit_chromedriver='xattr -d com.apple.quarantine $(which chromedriver) > /dev/null 2>&1'
alias brewdeps='brew leaves | xargs brew deps --installed --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"'
alias brewdump='pushd ~/root/projects/dotfiles && brew bundle dump --force && popd'
alias cheat='cat ~/root/projects/private/docs/cheat.txt'
alias chrspec='CAPYBARA_DRIVER=chrome bundle exec rspec'
alias cop='rubocop -A'
alias daily='update_all; daily_ruby_tasks'
alias delete_local_branches='git branch | grep -v \* | xargs git branch -D'
alias dco='docker-compose'
alias flush_dns_cache='sudo killall -HUP mDNSResponder'
alias git_set_head='git remote set-head origin -a'
alias gitb="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"
alias grep='grep -a'
alias kill_jamf='sudo watch -n 0.1 pkill -9 -i jamf'
alias src='source ~/.zshrc'
alias stp='mine ~/root/projects'
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
function merge_files { awk 'FNR==1{print ""}1' $@ }
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

  permit_chromedriver

  pushd ~/root/third_party/dev-toolbox && git pull && popd
  pushd ~/root/third_party/oh-my-zsh-plugins && git pull && popd

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
