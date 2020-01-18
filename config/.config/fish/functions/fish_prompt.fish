# name: fishyfish
# ---------------
# Display the following bits on the left:
# - Current directory name
# - Git branch and dirty state (if inside a git repo)

function _git_branch_name
  set -l branch_name (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  set -l commitish (command git rev-parse --short HEAD ^/dev/null)

  if [ $branch_name ]
    echo $branch_name
  else
    echo $commitish
  end
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _venv
  if test $VIRTUAL_ENV
    echo -n -s " · (" (basename "$VIRTUAL_ENV") ")"
  end
end

function fish_prompt
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l cwd $blue(pwd | sed "s:^$HOME:~:")

  echo -e ''

  echo -n -s $cwd $normal

  _venv

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info '(' $yellow $git_branch "±" $normal ')'
    else
      set git_info '(' $green $git_branch $normal ')'
    end
    echo -n -s ' · ' $git_info $normal
  end

  echo -e ''
  echo -e -n -s '> ' $normal
end
