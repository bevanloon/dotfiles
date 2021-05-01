function try_activate -a dir
  if test $dir = $HOME
    return
  end
  if test $dir = /
    return
  end
  set -l base (basename $dir)
  if test -e ~/.venv/$base/bin/activate.fish
    . ~/.venv/$base/bin/activate.fish
  else
    try_activate (dirname $dir)
  end
end

function venvup
  try_activate $PWD
end
