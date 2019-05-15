call plug#begin('~/.config/nvim/plugged')
Plug 'troydm/zoomwintab.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf'
Plug 'yssl/QFEnter'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'sebdah/vim-delve'

Plug 'morhetz/gruvbox'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'arcticicestudio/nord-vim'
call plug#end()

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Set extra options when running in GUI mode
if has("gui_vimr")
  set guioptions=
  let g:gruvbox_italic=1
endif

set background=dark
set termguicolors
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

let mapleader="\<Space>"

" gruvbox
hi vertsplit ctermfg=238 ctermbg=234 guifg=#444444 guibg=#1d2021
hi LineNr ctermfg=237 guifg=#3a3a3a
hi StatusLine ctermfg=234 ctermbg=245 guifg=#1d2021 guibg=#8a8a8a
hi StatusLineNC ctermfg=234 ctermbg=237 guifg=#1d2021 guibg=#3a3a3a
hi Search ctermbg=58 ctermfg=15 guibg=#5f5f00
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=234
hi GitGutterAdd ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
hi GitGutterChange ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
hi GitGutterDelete ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
hi GitGutterChangeDelete ctermbg=234 ctermfg=245 guibg=#1d2021 guifg=#8a8a8a
hi EndOfBuffer ctermfg=237 ctermbg=234 guifg=#3a3a3a guibg=#1d2021

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
" set autowrite
" set autoread
" set complete-=i
" set viminfo^=!
" set backspace=indent,eol,start
" set sessionoptions-=options

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

" vim-go
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
" let g:go_def_mode = "gopls"
" let g:go_info_mode = "gopls"
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
" let g:go_version_warning = 0
" let g:go_metalinter_enabled = ['golangci-lint']

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" autocmd Filetype go command! -bang R :GoReferrers
autocmd Filetype go command! -bang T :GoTest
autocmd Filetype go command! -bang R :GoRun
" autocmd Filetype go command! -bang D :GoDoc
" autocmd Filetype go command! -bang O :GoInfo
" autocmd Filetype go command! -bang C :GoCallees

" netrw
let g:netrw_banner = 0
map <Leader>nn :Explore<CR>
map <Leader>vn :Vexplore<CR>

" fzf.vim
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>g :Rg<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" quickfix plugin
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>']
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']
" move the quickfix window to the bottom of the window layout
autocmd FileType qf wincmd J

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
