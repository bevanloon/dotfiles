Dotfiles managed by [GNU Stow](https://www.gnu.org/software/stow/).

As it says...

> Stow is a symlink farm manager

## How to use it

Stow by default will create the various files and directories in its parent
directory. Of course there are options that allow you to set a target directory,
but there's less to remember if you simply clone this into `~/dotfiles`.

```
git clone https://github.com/bevanloon/dotfiles ~/dotfiles
cd dotfiles
stow vim
stow zsh
stow oh-my-zsh
stow git
```

## Background

For a better description of how this all hangs together, read [this blog
post](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).
