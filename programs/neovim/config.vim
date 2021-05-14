let base16colorspace=256
colo base16-gruvbox-dark-pale

" Permanent undo
set undodir=~/.vimdid
set undofile

" No line numbers
set nonumber

" Disable sound
set noeb vb t_vb= 

set encoding=utf8

" Enable filetype plugins
filetype plugin on
filetype indent on

" auto read when a file changed
set autoread

let mapleader = ","

" TODO: Maybe use this for something more common?
" Remove search highlighting
nnoremap <Leader><space> :noh<cr>

" Move to start and end of line with H and L
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" Enable typos
:command W w
:command Wq wq
:command Q q

" TODO: Investigate
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Configure search
set ignorecase
set hlsearch
set incsearch " TODO

set showmatch " Show matching brackets
set mat=2     " How many thenths of a second to blink when matching brackets

" Enable syntax highlighting
syntax enable

" Turn backup off TODO
set nobackup
set nowb
set noswapfile

" Expand tabs into spaces
set expandtab

set smarttab

set shiftwidth=2
set tabstop=2

set ai " Auto indent
set si " Smart indent

" Wrap lines
set wrap

" Search with space
" TODO: Backwards search with control space?
map <space> /

" Open nerdtree
map <C-N> :NERDTreeToggle<cr>

" TODO
" Tab for completion
" inoremap <silent><expr> <TAB>
    " \ pumvisible() ? "\<C-N>" :
    " \ <SID>check_back_space() ? "\<TAB>" :
    " \ coc#refresh()
" inoremap <expr><S-TAB> pubvisible() ? "\<C-p>" : "\<C-h>"

" Fzf central window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" TODO: Move into nix?
let $FZF_DEFAULT_OPTS='--reverse'


" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap <leader>f :FZF<cr>
noremap <leader>a :Rg<cr>
" TODO
" noremap <leader>c :Hoogle<cr>

" Remap Vim 0 to first non-blank character
map 0 ^


" TODO: Coc completion on tab, coc jump to definition ...
