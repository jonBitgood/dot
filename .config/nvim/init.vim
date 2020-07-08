
"Plug-ins
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'junegunn/goyo.vim'
    Plug 'vifm/vifm.vim'
    Plug 'junegunn/limelight.vim'
    " Currently broken Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
    " Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty' 
    Plug 'vim-scripts/fountain.vim'    
call plug#end() 
 
"General Settings
set encoding=UTF-8
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on

set notermguicolors
hi Terminal ctermbg=none

set autoread wildmode=longest,list,full
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls is ic
set laststatus=2 cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup

set number
set nu rnu


"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"NerdTree Navigation
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-o> :NERDTreeToggle<CR>



"Key-bindings
let mapleader=" "
nnoremap <leader>n :Explore<CR>
nnoremap <leader><Space> :CtrlP<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader>, :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
nnoremap <C-g> :set spelllang=de_de<CR>
nnoremap <C-l> :set background=light<CR>
nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>

nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap Q <nop>

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

map <F1> :colorscheme gruvbox<CR>
map <F2> :colorscheme base16-default-dark<CR>
map <F3> :colorscheme hybrid_reverse<CR>
map <F4> :colorscheme PaperColor<CR>
map <F5> :colorscheme spacegray<CR>

"Color Settings
colorscheme Earthsong
set background=dark cursorline termguicolors

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"Goyo settings
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    CocDisable
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set cursorline
    CocEnable
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 

