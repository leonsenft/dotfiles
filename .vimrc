" Enable modern Vim features not compatible with Vi.
set nocompatible

" Load external plugins.
call plug#begin()
Plug 'ap/vim-buftabline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'ervandew/supertab'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'gruvbox-community/gruvbox'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-sensible'
" Initialize plugin system. Automatically enables file type detection and
" syntax highlighting.
call plug#end()

" Enable spelling in terminal Vim.
let g:gruvbox_guisp_fallback="fg"

" Explicitly set background for consistency in and out of tmux.
set background=dark
set termguicolors

colorscheme gruvbox

" Show whether the buffer is modified.
let g:buftabline_indicators=1
" Show ordinal number in buffer label.
let g:buftabline_numbers=2

let g:lsc_auto_map = v:true
let g:lsc_server_commands = {'rust': 'rls'}

let g:netrw_banner = 0
let g:netrw_list_hide = '^\./$,^\.\./$'

let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

" Format files on write.
augroup autoformat
  " Set filetype for local repository BUILD.<name> files.
  autocmd BufRead,BufNewFile BUILD.* set filetype=bzl

  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType cpp AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
augroup END

let g:rustfmt_autosave = 1

" Use 2 spaces for indentation by default.
"
" See http://vim.wikia.com/wiki/Indenting_source_code for explanation.
set expandtab
set shiftwidth=2
set softtabstop=2

set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set matchpairs+=<:>
set noswapfile
set number
set relativenumber
set smartcase
set spell spelllang=en_us
set splitbelow
set splitright
set statusline=\ %F\ %=\ L:\ %-9(%l/%L%)\ C:\ %-4c

" Hide trailing '~' characters.
hi EndOfBuffer ctermfg=Black

" Improve common command mappings.
let mapleader=','
nnoremap ; :
nnoremap Y y$

" ",n" opens the next buffer.
nmap <silent> <leader>n :bnext <cr>

" ",p" opens the previous buffer.
nmap <silent> <leader>p :bprev <cr>

" ",{number}" opens a buffer by ordinal position.
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" ",/" clears search results.
nnoremap <silent> <leader>/ :nohlsearch <bar> :echo <cr>

" ",l" toggles relative line numbers.
nnoremap <silent> <leader>l :setlocal relativenumber! <cr>

" ",s" toggles spell checking.
nnoremap <silent> <leader>s :setlocal spell! spelllang=en_us <cr>
