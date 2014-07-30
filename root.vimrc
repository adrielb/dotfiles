
filetype plugin indent on
syntax on
set history=10000
set nowrap
set wildmenu
set wildmode=list:longest:full
set backspace=indent,eol,start
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set mouse-=a
set laststatus=2
set ignorecase
set nowrapscan " don't loop to beginning
set smartcase
set incsearch        " do incremental searching
set hlsearch
set title
set number           " show line numbers
set relativenumber
set colorcolumn=+1
set showmatch        " Show matching brackets
set scrolloff=3
set sidescrolloff=3
set switchbuf=usetab
set hidden
set autoread
set autowriteall
set gdefault
set undofile
set foldmethod=marker
set wildignore+=.git
set wildignore+=*.hi,*.x
set wildignore+=*.so,*.a,*.la,*.o
set wildignore+=*.sw?,*.un~,*.pyc,*.class
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.aux,*.dvi,*.toc,*.pdf,*.ps
set wildignore+=*.mp3,*.m4a,*.wav,*.flac
set wildignore+=*.mp4,*.avi
set shortmess+=I  " no intro msg
set clipboard+=unnamedplus
set report=0
set noesckeys
set listchars=trail:█,tab:>~,eol:¶,extends:»,precedes:«
set fillchars=vert:│,fold:\_,diff:⣿
set completeopt-=preview
set lazyredraw

noremap  gV `[v`]
nnoremap gs :update<CR>
" line text object
vnoremap al :<C-U>normal! 0v$h<CR>
vnoremap il :<C-U>normal! ^vg_<CR>
onoremap al :norm val<CR>
onoremap il :norm vil<CR>
" _af fold text-object
vnoremap af :<C-U>silent! normal! [zV]z<CR>
omap     af :normal Vaf<CR>
vnoremap if :<C-U>silent! normal! [zjV]zk<CR>
omap     if :normal Vif<CR>
nnoremap ' `
nnoremap ` '
nnoremap Q @q
xnoremap Q :norm @q<CR>
nnoremap Y y$
nnoremap ZZ :wqa<CR>
nnoremap n nzxzz
nnoremap N Nzxzz
inoremap <C-U> <C-G>u<C-U>
nnoremap <C-Q> :wincmd c<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>l  :nohlsearch<CR><C-L>:checktime<CR>
nnoremap <leader>b  :buffer <C-z><S-TAB>
nnoremap <leader>f  :find <C-R>=expand('%:h').'/*'<CR><C-z>
nnoremap <leader>q  :bp\|bd #<CR>
nnoremap <leader>m  :make<CR>
nnoremap <leader>v  :vertical resize 80<CR>
nnoremap <leader>x *``cgn
nnoremap <leader>X #``cgN
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>Y "+Y
xnoremap <leader>Y "+Y
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>P "+P
nnoremap <up>       :lprev<CR>
nnoremap <down>     :lnext<CR>
nnoremap <left>     :cprev<CR>
nnoremap <right>    :cnext<CR>
nnoremap <BS>       a<BS>
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

augroup vimrcEx
  au!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
