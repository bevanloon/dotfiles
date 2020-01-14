set -x GPG_TTY (tty)

set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

if not pgrep -f gpg-agent >> /dev/null
  gpg-agent --daemon
end

