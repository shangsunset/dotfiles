call plug#begin('~/.config/nvim/plugged')

Plug 'ervandew/supertab'
Plug 'troydm/zoomwintab.vim'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'mileszs/ack.vim'
Plug 'andreypopp/vim-colors-plain'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set background=light
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme plain

let mapleader="\<Space>"

set clipboard+=unnamedplus

set number
set autoindent
set backspace=indent,eol,start
set complete-=i
set incsearch
set laststatus=2
set display+=lastline
set autoread
set viminfo^=!
set sessionoptions-=options
set number                          " show line numbers
set lazyredraw                      " Don't redraw while executing macros (good performance config)
set nohlsearch                      " Don't continue to highlight searched phrases.
set hlsearch                        " Highlight search results
set magic                           " For regular expressions turn magic on
set smartindent                     " automatically insert one extra level of indentation
set splitright                      " To make vsplit put the new buffer on the right of the current buffer
set expandtab                       " use spaces instead of tabs
set nowrap                          " don't wrap text
set fo-=t                           " don't automatically wrap text when typing
set hidden                          " A buffer becomes hidden when it is abandoned
set showmatch
set smartcase
set wildmenu
set noshowmode
set nobackup
set nowritebackup
set noswapfile


autocmd FileType make setlocal sw=2 ts=2 sts=2 noexpandtab
autocmd FileType json setlocal sw=2 ts=2 sts=2
autocmd FileType yaml setlocal sw=2 ts=2 sts=2
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
autocmd FileType vim  setlocal sw=2 ts=2 sts=2
autocmd FileType go setlocal sw=2 ts=2 sts=2


inoremap fd <esc>

" move inside a long line
nnoremap <buffer> k gk
nnoremap <buffer> j gj

" bind Ctrl+<movement> keyt to move around the windows, instead of using
" Ctrl+w + <movement>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" smooth scrolling
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" select all
map <Leader>a ggVG


" Insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" better indentation
vnoremap < <gv
" better indentation
vnoremap > >gv

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" commenting
nmap ,, gcc
vmap ,, gc

" vim-go
let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <leader>gfm :GoFmt<cr>


fu! Retab()
    set expandtab
    retab
endfunction

autocmd BufWritePre *.go ks|call Retab()

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" init.vim
map <Leader>conf :e $MYVIMRC<CR>
map <Leader>sv :source $MYVIMRC<CR>

" fzf.vim
map <Leader>t :Files<CR>
map <Leader>b :Buffers<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
