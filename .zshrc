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
alias brewdeps='brew leaves | xargs brew deps --installed --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"'
alias brewdump='pushd ~/root/projects/dotfiles && brew bundle dump --force && popd'
alias bundle_update='bundle update --bundler --quiet'
alias cheat='cat ~/root/projects/private/notes/cheat.txt'
alias chrspec='CAPYBARA_DRIVER=chrome bundle exec rspec'
alias cop='rubocop -A'
alias dco='docker-compose'
alias delete_local_branches='git branch | grep -v \* | xargs git branch -D'
alias disable_apps='p1; sudo chmod a-x "/Applications/1Password 7.app"; sudo chmod a-x "/Applications/Slack.app"'
# alias disable_jamf_daemon='p1; sudo chmod a-x "/Library/Application Support/JAMF/Jamf.app/Contents/MacOS/JamfDaemon.app"'
alias disable_jamf='p1; sudo chmod a-x "/Applications/Jamf Connect.app"; sudo chmod a-x "/Applications/Jamf Trust.app"; sudo chmod a-x "/Applications/JamfProtect.app"; sudo chmod a-x "/Library/Application Support/JAMF/Jamf.app"; sudo chmod a-x "/usr/local/jamf/bin/jamf"'
alias flush_dns_cache='p1; sudo killall -HUP mDNSResponder'
alias gem_update='gem_update_system; gem_install; gem_update_gems'
alias gem_update_system='gem update --system --silent'
alias gem_install='gem install --silent bundler byebug flog foreman guard interactive_editor nutrella pony pry rake rspec rubocop sinatra unicorn whats_up'
alias gem_update_gems='gem update --silent bundler byebug flog foreman guard interactive_editor nutrella pony pry rake rspec rubocop sinatra unicorn whats_up'
alias git_set_head='git remote set-head origin -a'
alias gitb="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"
alias grep='grep -a'
alias kill_chrome='pkill -9 -i chrome'
alias kill_docker='pkill -9 -i docker'
alias kill_jamf='p1; sudo watch -n 0.1 pkill -9 -i jamf'
alias meld="open -W -a Meld $@"
alias minep='mine ~/root/projects'
alias permit='xattr -d com.apple.quarantine'
alias permit_chromedriver='xattr -d com.apple.quarantine $(which chromedriver) > /dev/null 2>&1'
alias py='python'
alias seed_run='curl https://raw.githubusercontent.com/nulogy/how-to-code/main/run -o ./run; chmod a+x ./run'
alias seed_run_cop='curl https://raw.githubusercontent.com/nulogy/how-to-code/main/run_cop -o ./run; chmod a+x ./run'
alias sp='open -n -a "Google Chrome" --args "https://jamboard.google.com/d/15l8zMMOTIQc5iVgxQ4_7Krn_3F0SK8bDRukbzo7HdW8/viewer?f=0"'
alias src='source ~/.zshrc'
alias stow_dotfiles='stow --dir=$HOME/root/projects --target=$HOME dotfiles'
alias stow_dotfiles_delete='stow -D --dir=$HOME/root/projects --target=$HOME dotfiles'
alias stp='subl ~/root/projects'
alias trello=nutrella
alias update_pgadmin='brew install --cask --force pgadmin4'

##
# gh setup reference:
# https://github.com/jchunky/notes/wiki/Create-alias-for-making-pull-requests
#
alias mkpr='gh pr create -f --body ""'
alias vwpr='mkpr; gh pr view --web'

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

# public zsh files
for dotfile in ~/.zsh/*.zsh; do
  source "$dotfile"
done

# private zsh files
for dotfile in ~/root/projects/private/.zsh/*.zsh; do
  source "$dotfile"
done
