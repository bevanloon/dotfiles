set -gx VIRTUAL_ENV_DISABLE_PROMPT "TRUE"
set -gx PATH /usr/local/opt/python/libexec/bin $PATH
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
