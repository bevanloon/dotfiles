call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'gosukiwi/vim-atom-dark'
Plug 'rakr/vim-one'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-rails'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go'
Plug 'rainux/vim-desert-warm-256'
Plug 'danilo-augusto/vim-afterglow'
Plug 'raphamorim/lucario'
Plug 'dracula/vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'JarrodCTaylor/spartan'
Plug 'kamwitsta/mythos'
Plug 'orthecreedence/void.vim'
Plug 'kamwitsta/nordisk'
Plug 'arcticicestudio/nord-vim'
Plug 'trevordmiller/nova-vim'
Plug 'clinstid/eink.vim'
Plug 'robertmeta/nofrils'
Plug 'sjl/badwolf'
Plug 'vim-scripts/tir_black'
Plug 'owickstrom/vim-colors-paramount'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'szorfein/fantasy.vim'
Plug 'jeffkreeftmeijer/vim-dim'
call plug#end()

let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
"let g:airline#extensions#tabline#enabled = 1

" use Ctrl-t for Command P plugin
:nmap <c-t> <plug>(ctrlp)
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_clear_cache_on_exit = 0
" jj to esc
:imap jj <Esc>

" empty line insertion
:nmap <CR> o<Esc>

" extra easy buffer movement
:map [b :bp<cr>
:map ]b :bn<cr>
command BD bp\|bd \#
:nmap ,t :w !ruby %<cr>
:nmap ,r :w <cr> :!rspec %<cr>

set nocompatible
set t_Co=256
set termguicolors
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set background=dark
"set term=xterm-256color
"colorscheme Tomorrow-Night
"colorscheme tender
"colorscheme deep-space
"let g:jellybeans_background_color_256=0
"colorscheme jellybeans
"colorscheme Tomorrow-Night-Highlight
if ($ITERM_PROFILE == 'Solarized')
  colorscheme solarized
else
  if ($ITERM_PROFILE == 'Nord' || $ITERM_PROFILE == 'Nord-dark')
    colorscheme nord
    let g:nord_comment_brightness = 2
  else
    "set t_Co=256
    "set termguicolors
    "colorscheme nofrils-dark
    "let g:quantum_black=1
    colorscheme smyck
  endif
endif

" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set vb t_vb=

set nowrap
set expandtab shiftwidth=2 softtabstop=2

au FileType python setlocal ts=4 sw=4 sts=4

set number
set ruler
set list

set listchars=""
set listchars=tab:>>
set listchars+=trail:•

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"highlight ColorColumn ctermbg=235 guibg=#2c2d27
"autocmd Filetype gitcommit let &colorcolumn="50,70"
:highlight ColorColumn ctermbg=235 guibg=brown
autocmd Filetype gitcommit let &colorcolumn="50,70"
"set colorcolumn=80
hi IncSearch ctermfg=Black  ctermbg=lightyellow cterm=bold,underline,reverse

au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.markdown setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal wrap linebreak nolist
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist
au BufRead,BufNewFile *.markdown setlocal wrap linebreak nolist
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist
autocmd Filetype text let &colorcolumn=80

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline_theme='simple'
let g:airline#extensions#branch#displayed_head_limit = 1
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

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" File types to ignore
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/tmp/*
set wildignore+=*/.git/*,*/.rbx/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*.swp,*~,._*
