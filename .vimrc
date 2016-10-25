call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'gosukiwi/vim-atom-dark'
Plug 'rakr/vim-one'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-rails'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts = 1

:nmap <c-t> <plug>(ctrlp)
:nmap <c-p> <plug>(ctrlp)
:map [b :bp<cr>
:map ]b :bn<cr>
:nmap :BD :bn\|bd # <cr>

set nocompatible
set t_Co=256
set background=dark
"colorscheme tender
"colorscheme deep-space
colorscheme Tomorrow-Night

set relativenumber

set visualbell

set nowrap
set expandtab shiftwidth=2 softtabstop=2

set number
set ruler
set list

set listchars=""
set listchars=tab:>>
set listchars+=trail:.


set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

autocmd Filetype gitcommit let &colorcolumn="50,70"
set colorcolumn=80

function ReplaceNERDTreeIfDirectory()
    if argc() == 1 && isdirectory(argv(0))
        enew
        NERDTree
    end
endfunction

augroup NERDTreeHijackNetrw
    au VimEnter * call ReplaceNERDTreeIfDirectory()
augroup END


function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

silent! map <C-n> :NERDTreeToggle<CR> 
silent! map <F3> :NERDTreeFind<CR>

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
