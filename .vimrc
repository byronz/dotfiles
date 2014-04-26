" 1. https://raw.github.com/thoughtbot/dotfiles/master/vimrc
" 2. https://github.com/square/maximum-awesome/blob/master/vimrc


" General settings
set nocompatible
syntax on

filetype plugin indent on

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  " source ~/.vimrc.bundles.local
endif

colorscheme Darkside

let mapleader=','
let maplocalleader='\'

set mousehide
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set autoread
set autowrite
set hidden
set number
set history=1000
set clipboard+=unnamed
set encoding=utf-8
" set spell
set modeline
set ttyfast
set shortmess=I
set wildmenu
set wildmode=longest,list,full
set noerrorbells
set novisualbell
set t_vb=
set completeopt+=longest
set completeopt-=preview
set viewoptions+=slash,unix
set viewoptions-=options
set fileformats=unix,mac,dos
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set showtabline=2
set laststatus=2
set noshowmode

set backspace=indent,eol,start
set whichwrap+=h,l,<,>,[,]
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=3 " Minimal number of screen columns to keep away from cursor
set showmatch
set matchtime=2
set formatoptions+=rnlmM
set wrap
set textwidth=100
set colorcolumn=+1
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
set scrolloff=3
set linebreak
set showcmd
set showbreak=↪
set fillchars=diff:⣿,vert:│
set t_Co=256

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault " turn on 'g' flag

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <Leader><Space> :set hlsearch!<CR>
nnoremap <C-P>  :CtrlP<CR>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

nnoremap \= gg=G

" fix tmux cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" facilitate .vimrc
autocmd BufWritePost .vimrc source $MYVIMRC " auto source
nnoremap <Leader>x :tabedit $MYVIMRC<CR> " fast edit the .vimrc file using ',x'

" plugin setting
" --------------------------------------------------------------------------------------------------

nmap <leader>g :GitGutterToggle<CR>
let g:gitgutter_enabled = 1

" ag is faster than ack
nnoremap <Leader>a :Ag<Space>
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <Leader>s :Errors<CR>
let g:syntastic_check_on_open=0
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" ctrlp

nmap <leader>p :CtrlP<CR>

let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_map = ',e'

" pymode
let g:pymode_lint_write = 0
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
let g:pymode_lint_ignore = ""
let g:pymode_lint_signs = 0
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pyflakes_use_quickfix = 0


" neo compelte

let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neosnippet#enable_snipmate_compatibility=1

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Use Tab instead of % to switch using matchit
nmap <Tab> %
vmap <Tab> %


" language settings

augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

augroup ft_quickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap textwidth=0
augroup END

augroup ft_cucumber
    autocmd BufWritePre *.feature :%s/\s\+$//e
    autocmd filetype cucumber setlocal shiftwidth=2 softtabstop=2
augroup END

augroup ft_markdown
    autocmd!
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>

    autocmd BufRead,BufNewFile *.md set filetype=markdown

    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>

    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>

    " Use <Leader>P to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>

augroup END

augroup ft_less
    autocmd!
    autocmd filetype less nnoremap <buffer> <Leader>r :w <BAR> !lessc % > %:t:r.css<CR><Space>
augroup END

augroup ft_json
    autocmd!
    autocmd filetype json setlocal conceallevel=0
    autocmd filetype json setlocal foldmethod=syntax
augroup END

augroup ft_python
    autocmd BufWritePre *.py :%s/\s\+$//e
augroup END

augroup ft_ruby
    autocmd!
    autocmd filetype ruby setlocal shiftwidth=2 softtabstop=2
augroup END

augroup ft_perl
    let perl_include_pod=1
    let perl_extended_vars=1
    let perl_sync_dist=250
    autocmd!
    autocmd filetype perl setlocal keywordprg=perldoc\ -f
augroup END
