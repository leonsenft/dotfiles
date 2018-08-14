call plug#begin()
Plug 'ap/vim-buftabline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'natebosch/vim-lsc'
call plug#end()

" Show whether the buffer is modified.
let g:buftabline_indicators=1
let g:lsc_auto_map = v:true
let g:lsc_enable_apply_edit = v:true
let g:lsc_server_commands = {
    \ 'dart': 'dart_language_server',
    \ 'html': 'dart_language_server' }
let g:netrw_banner = 0
let g:netrw_list_hide = '^\./$,^\.\./$'
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

augroup autoformat
  autocmd FileType dart AutoFormatBuffer dartfmt
augroup END

set autoindent
set backspace=indent,eol,start
set completeopt-=preview
set fillchars+=vert:\ " Force trailing whitespace
set foldmethod=marker
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:>
set nocompatible
set noswapfile
set number
set relativenumber
set scrolloff=5
set smartcase
set splitbelow
set splitright
set statusline=\ %F\ %=\ L:\ %-9(%l/%L%)\ C:\ %-4c

" Hide end of buffer '~' characters
hi EndOfBuffer ctermfg=Black

" Buffer highlights
hi BufTabLineActive cterm=bold ctermfg=Black ctermbg=LightGray
hi BufTabLineHidden cterm=bold ctermfg=DarkGray ctermbg=LightGray

" Improve common command mappings
let mapleader=' '
nnoremap ; :
nnoremap Q @q

" Buffer navigation
nmap <silent> <leader>n :bnext <cr>
nmap <silent> <leader>p :bprev <cr>
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

" Clears highlighted search matches
nnoremap <silent> <cr> :nohlsearch <bar> :echo <cr>

" Centers cursor in window
nnoremap n nzz
nnoremap N Nzz

" Toggles relative line numbers
nnoremap <silent> <leader>l :setlocal relativenumber! <cr>

" Toggles spell checking
nnoremap <silent> <leader>s :setlocal spell! spelllang=en_us <cr>
