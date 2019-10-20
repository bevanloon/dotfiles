# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bevanloon/.oh-my-zsh"

ZSH_THEME="bevanloon"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias be="bundle exec"
alias fabenv="source ~/venv/fabric-scripts/bin/activate"

export PATH=$HOME/govuk/govuk-cli/bin:$HOME/govuk/gds-cli:$PATH
export PATH=$HOME/govuk/govuk-docker/bin:$PATH
export HOMEBREW_NO_ANALYTICS=1
eval "$(rbenv init -)"
