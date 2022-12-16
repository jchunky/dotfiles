# zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
DISABLE_UPDATE_PROMPT=true
plugins=(bundler chruby git gitfast history nulogy ruby sublime timer $plugins)
# plugins=(brew gem kubectl macos rake wd $plugins)
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
export PATH=.:./bin:~/.bin:~/bin:~/root/projects/private/.bin:$PATH

# cdpath
export CDPATH=~/root/projects/apps:$CDPATH
export CDPATH=~/root/projects/dotfiles/.bin:$CDPATH
export CDPATH=~/root/projects/exercism/ruby:$CDPATH
export CDPATH=~/root/projects/katas:$CDPATH
export CDPATH=~/root/projects/others:$CDPATH
export CDPATH=~/root/projects:$CDPATH
export CDPATH=~/root:$CDPATH
export CDPATH=~/src/production-scheduling:$CDPATH
export CDPATH=~/src:$CDPATH

# homebrew
export HOMEBREW_NO_ENV_HINTS=true
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-you-should-use
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh

# aliases
alias a='alias | grep -i'
alias permit_chromedriver='xattr -d com.apple.quarantine $(which chromedriver) > /dev/null 2>&1'
alias brewdeps='brew leaves | xargs brew deps --installed --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"'
alias brewdump='pushd ~/root/projects/dotfiles && brew bundle dump --force && popd'
alias cheat='cat ~/root/projects/private/docs/notes/cheat.txt'
alias chrspec='CAPYBARA_DRIVER=chrome bundle exec rspec'
alias cop='rubocop -A'
alias delete_local_branches='git branch | grep -v \* | xargs git branch -D'
alias dco='docker-compose'
alias disable_1password='p1; sudo chmod a-x "/Applications/1Password.app"'
alias flush_dns_cache='p1; sudo killall -HUP mDNSResponder'
alias git_set_head='git remote set-head origin -a'
alias gitb="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"
alias grep='grep -a'
alias kill_apps='p1; sudo chmod a-x "/Applications/1Password 7.app"; sudo chmod a-x "/Applications/Slack.app"'
alias kill_chrome='pkill -9 -i chrome'
alias kill_docker='pkill -9 -i docker'
alias kill_jamf='p1; sudo watch -n 0.1 pkill -9 -i jamf'
alias minep='mine ~/root/projects'
alias py='python'
alias seed_run='curl https://raw.githubusercontent.com/nulogy/how-to-code/main/run -o ./run; chmod a+x ./run'
alias seed_run_cop='curl https://raw.githubusercontent.com/nulogy/how-to-code/main/run_cop -o ./run; chmod a+x ./run'
alias src='source ~/.zshrc'
alias stp='subl ~/root/projects'
alias stow_dotfiles='stow --dir=$HOME/root/projects --target=$HOME dotfiles'
alias stow_dotfiles_delete='stow -D --dir=$HOME/root/projects --target=$HOME dotfiles'
alias trello=nutrella

# git
alias gd='git diff -b'
alias gdca='git diff -b --cached'
alias gdcw='git diff -b --cached --word-diff'
alias gds='git diff -b --staged'
alias gdw='git diff -b --word-diff'

# functions
function brupdate { brew update; brew upgrade; brew cleanup; brew doctor; }
function merge_files { awk 'FNR==1{print ""}1' $@ }
function ruby_use { chruby `cat .ruby-version` }
function stop_spring {
  bundle --quiet
  bundle exec spring stop
  bundle exec rails tmp:clear
}
function update_homebrew {
  rm -rf /usr/local/var/homebrew/locks
  brew cleanup -q
  brewdump
  brew update -q
  brew upgrade -q
  brew upgrade -q --cask
  brew cleanup -q
  permit_chromedriver
}
function update_gems {
  gem update --system
  gem install bundler byebug flog foreman guard interactive_editor nutrella pony pry rake rspec rubocop sinatra unicorn whats_up
  gem update  bundler byebug flog foreman guard interactive_editor nutrella pony pry rake rspec rubocop sinatra unicorn whats_up
}

##
# mkpr setup reference:
# https://github.com/jchunky/notes/wiki/Create-alias-for-making-pull-requests
#
function mkpr {
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD);
  hub pull-request -m "${BRANCH_NAME}"
}

# public zsh files
for dotfile in ~/.zsh/*.zsh; do
  source "$dotfile"
done

# private zsh files
for dotfile in ~/root/projects/private/.zsh/*.zsh; do
  source "$dotfile"
done
