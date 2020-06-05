call plug#begin('~/.config/nvim/plugged')
Plug 'troydm/zoomwintab.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'yssl/QFEnter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'sebdah/vim-delve'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
call plug#end()

" filetype indent on    " Enable filetype-specific indenting
" filetype plugin on    " Enable filetype-specific plugins

set background=dark
set termguicolors
colorscheme gruvbox

let mapleader="\<Space>"

" gruvbox
" hi clear SignColumn
" hi vertsplit ctermfg=238 ctermbg=234 guifg=#444444 guibg=#1d2021
" hi LineNr ctermfg=237 guifg=#3a3a3a
" hi StatusLine ctermfg=234 ctermbg=245 guifg=#1d2021 guibg=#8a8a8a
" hi StatusLineNC ctermfg=234 ctermbg=237 guifg=#1d2021 guibg=#3a3a3a
" hi Search ctermbg=58 ctermfg=15 guibg=#5f5f00
" hi Default ctermfg=1
" hi SignColumn ctermbg=234
" hi GitGutterAdd ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
" hi GitGutterChange ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
" hi GitGutterDelete ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
" hi GitGutterChangeDelete ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
" hi EndOfBuffer ctermfg=237 ctermbg=234 guifg=#3a3a3a guibg=#1d2021

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
set incsearch                       " when search with /, it will move the highlight as you add characters to the search keyword
set display+=lastline               " When included, as much as possible of the last line in a window will be displayed.  When not included, a last line that doesn't fit is replaced with "@" lines
set completeopt-=preview            " No preview window
set lazyredraw
set regexpengine=1
set autoindent
set updatetime=250
set laststatus=2
set showmatch
set smartcase
set linespace=3
set wildmenu
set nobackup
set nowritebackup
set noswapfile
set clipboard+=unnamedplus
set encoding=UTF-8

autocmd FileType make setlocal sw=2 ts=2 sts=2 noexpandtab
autocmd FileType json setlocal sw=2 ts=2 sts=2
autocmd FileType vim setlocal sw=2 ts=2 sts=2
autocmd FileType yaml setlocal sw=2 ts=2 sts=2

inoremap fd <esc>

" move inside a long line
nnoremap <buffer> k gk
nnoremap <buffer> j gj

" bind Ctrl+<movement> keyt to move around the windows, instead of using Ctrl+w + <movement>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

nnoremap <C-g> :NERDTreeToggle %<CR>
nnoremap <leader>nn :Explore<CR>

let g:SuperTabDefaultCompletionType = "<c-n>"

let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }

execute 'source' fnameescape(expand('~/.config/nvim/config/coc.vim'))
execute 'source' fnameescape(expand('~/.config/nvim/config/fzf.vim'))
