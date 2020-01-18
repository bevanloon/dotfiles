while read -la line
  eval $line | string replace 'export' 'set' | string replace '=' ' '
end < .envrc
