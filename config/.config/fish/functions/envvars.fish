function envvars
while read -la line
  eval $line | string replace 'export' 'set -x' | string replace '=' ' '
end < .envrc
end
