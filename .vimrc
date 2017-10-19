" filetype off
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'terryma/vim-multiple-cursors'
Plug 'sjl/gundo.vim'
Plug 'Shougo/neocomplete'
Plug 'edkolev/tmuxline.vim', { 'on': [] }
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'vim-scripts/tComment'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-vinegar'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
call plug#end()
" Put your non-Plugin stuff after this line


" Generl Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


filetype indent on
filetype plugin on



syntax enable "enable syntax highlighting (previously syntax on).
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme base16-unikitty-dark


let mapleader="\<Space>"

set number                          " show line numbers
set laststatus=2                    " last window always has a statusline
set nohlsearch                      " Don't continue to highlight searched phrases.
set incsearch                       " But do highlight as you type your search.
set ignorecase                      " Make searches case-insensitive.
set hlsearch                        " Highlight search results
set ruler                           " Always show info along bottom.AA
set magic                           " For regular expressions turn magic on
set autoindent                      " auto-indent
set smarttab                        " use tabs at the start of a line, spaces elsewhere
set splitright                      " To make vsplit put the new buffer on the right of the current buffer
set shiftround                      " always indent/outdent to the nearest tabstop
set nowrap                          " don't wrap text
set lazyredraw                      " redraw only when we need to.
set clipboard=unnamed               " make yank copy to the global system clipboard 
set nowrap                          " don't automatically wrap on load
set fo-=t                           " don't automatically wrap text when typing
set pastetoggle=<F10>               " toggle paste on/off in insert mode
set viminfo^=%                      " Remember info about open buffers on close
set hidden                          " A buffer becomes hidden when it is abandoned
set backspace=indent,eol,start      " configure backspace so it acts as it should act
set expandtab
set showmatch
set autoread
set smartcase
set wildmenu
set ttyfast
set mouse=a
set noshowmode
set nobackup
set nowritebackup
set noswapfile
set visualbell
set timeoutlen=1000 ttimeoutlen=0
set wildignore=*.o,*~,*.pyc,*build/*,*/coverage/*,*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd,node_modules/*,*/tmp/*,*.so,*.swp,*.zip


autocmd FileType make setlocal sw=2 ts=2 sts=2 noexpandtab
autocmd FileType python setlocal sw=4 ts=4 sts=4

autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType go setlocal sw=2 ts=2 sts=2
autocmd FileType json setlocal sw=2 ts=2 sts=2
autocmd FileType yaml setlocal sw=2 ts=2 sts=2

autocmd Filetype markdown setlocal wrap linebreak nolist



" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" Zoom / Restore window
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    exec t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction

command! ZoomToggle call s:ZoomToggle()
nnoremap <c-w>o :ZoomToggle<CR>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif


" Disable paste mode when leaving Insert Mode paste
autocmd InsertLeave * set nopaste



" Plugin Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif



" CtrlP
let g:ctrlp_working_path_mode = 'ra'
map <leader>p :CtrlP<CR>
map <leader>bb :CtrlPBuffer<cr>
map <leader>m :CtrlPMRU<cr>
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|target|dist|vendor)|(\.(swp|ico|git|svn))$',
      \ 'file': '\.exe$\|\.so$\|\.dat$'
      \ }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


" neocomplete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


" tmux
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H',
      \'options' : {'status-justify' : 'left'}}


" auto pairs
let g:AutoPairsMapSpace = 0


" vim-go
" let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_fmt_autosave = 0
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>df <Plug>(go-def-split)
au FileType go nmap <leader>fm :GoFmt<cr>


fu! Retab()
    set expandtab
    retab
endfunction

autocmd BufWritePre *.go ks|call Retab()

" Key Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap fd <esc>

"move inside a long line
nnoremap <buffer> k gk
nnoremap <buffer> j gj

" bind Ctrl+<movement> keyt to move around the windows, instead of using
" Ctrl+w + <movement>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close all the buffers
map <leader>ba :1000 bd!<cr>

map <leader>bd :bd<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>


"select all
map <Leader>a ggVG


" Insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"better indentation
vnoremap < <gv
"better indentation
vnoremap > >gv

"Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

"tComment mapping
map <Leader>c <c-_><c-_>

" gundo
nnoremap <F5> :GundoToggle<CR>


" toggle past on/off in normal mode
nnoremap <F10> :set invpaste paste?<CR>

" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    set guifont=Fira\ Code:h12
    set guicursor+=a:blinkon0
    set linespace=3
    set guioptions=
endif
