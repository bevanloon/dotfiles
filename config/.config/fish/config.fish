abbr -a -g be bundle exec
abbr -a -g fabenv source ~/venv/fabric-scripts/bin/activate
export HOMEBREW_NO_ANALYTICS=1

set -x GPG_TTY (tty)

set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

status --is-interactive; and source (rbenv init -|psub)
