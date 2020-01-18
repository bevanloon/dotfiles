function venvup
  set -l base (basename $PWD)
  if test -e ~/.venv/$base/bin/activate.fish
    . ~/.venv/$base/bin/activate.fish
  end
end
