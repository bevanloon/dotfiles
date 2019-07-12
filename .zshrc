# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/bevanloon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="bevan"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export PATH=/usr/local/bin:$PATH
alias be="bundle exec"
alias lsla="ls -la"
alias br="bin/rails"

alias govlint="bundle exec govuk-lint-ruby --diff --cached  app test lib"


alias re_up_the_vm="vagrant up"
alias ssh_in_to_the_vm="vagrant ssh"
alias vm="fireitup"

# Get the VM up and running
function fireitup() {
  cd ~/govuk/govuk-puppet/development-vm
  vm_up=`vagrant status | grep 'running'`
  if [ -z "$vm_up" ] ; then
    echo "Hang on......Vagrant is down, pulling it up"
    set -v
    re_up_the_vm
    set +v
  fi
  set -v
  ssh_in_to_the_vm
  set +v
}

function bebold() {
  cd ~/govuk/govuk-puppet/development-vm
  vagrant ssh --command "cd /var/govuk/development && bundle exec bowl www whitehall government-frontend --without panopticon --without rummager --without rummager-publishing-listener"
}

function lab() {
  git_branch=$(git branch | grep \* | cut -d ' ' -f2)
  remote_url="$(git ls-remote --get-url | sed -e 's/:/\//' | sed -e 's/git@/https:\/\//' | sed -e 's/\.git//')/compare/master...$git_branch"
  open -a /Applications/Firefox.app -g $remote_url
}

eval "$(rbenv init -)"

# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export GOPATH=$HOME/go

alias oc="sudo openconnect -v --pfs --no-dtls -u $USER https://vpn.digital.cabinet-office.gov.uk/ah"
alias ocdr="sudo openconnect -v --pfs --no-dtls -u $USER https://vpndr.digital.cabinet-office.gov.uk/ah"
alias fabenv="source ~/venv/fabric-scripts/bin/activate"
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/govuk/govuk-docker/bin
