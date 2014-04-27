set nocompatible
let mapleader="\<Space>"

filetype plugin indent on
syntax on
colorscheme slate
set history=10000
set nowrap
set wildmenu
set wildmode=list:longest:full
set backspace=indent,eol,start
set ruler
set showcmd
set mouse-=a
set laststatus=2
set ignorecase
set nowrapscan
set smartcase
set incsearch
set hlsearch
set title
set number
set relativenumber
set colorcolumn=+1
set showmatch
set scrolloff=3
set switchbuf=usetab
set hidden
set autoread
set autowriteall
set gdefault
set undofile
set foldmethod=marker
set wildignore+=.git
set wildignore+=*.so,*.a,*.la,*.o
set wildignore+=*.sw?,*.un~,*.pyc,*.class
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.aux,*.dvi,*.toc,*.pdf,*.ps
set wildignore+=*.mp3,*.m4a,*.wav,*.flac
set wildignore+=*.mp4,*.avi
set guifont=DejaVu\ Sans\ Mono\ 12
set guioptions-=m " no menubar
set guioptions-=T " no toolbar
set guioptions-=L " no left scrollbar
set guioptions-=r " no right scrollbar
set shortmess+=I
set clipboard+=unnamedplus
set report=0
set noesckeys
set listchars=trail:█,tab:>~,eol:¶,extends:>,precedes:<
set completeopt-=preview
set lazyredraw

nmap Q gqip
vmap Q gq
inoremap <C-U> <C-G>u<C-U>
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
nnoremap Y y$
nnoremap n nzxzz
nnoremap N Nzxzz
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>l  :nohlsearch<CR><C-L>

nnoremap <leader>w  :update<CR>
nnoremap <leader>q  :bp\|bd #<CR>
nnoremap <leader>m  :make<CR>
nnoremap <leader>v  :vertical resize 80<CR>
nnoremap <leader>y "+yiW:echo "Copied"<CR>
xnoremap <leader>y "+y
nnoremap <leader>Y "+YiW
xnoremap <leader>Y "+Y
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>P "+P
nnoremap <up>       :lprev<CR>
nnoremap <down>     :lnext<CR>
nnoremap <left>     :cprev<CR>
nnoremap <right>    :cnext<CR>
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" Crypt settings
set cryptmethod=blowfish
set noswapfile
set nowritebackup
set viminfo= 
set nobackup
set noshelltemp
set history=0
set secure

nnoremap <leader>j zv[z:/Password<CR>ww"+yiW:echo "Copied password"<CR>
nnoremap <leader>k :call CopyField("Username")<CR>
nnoremap <leader>m :r!pwgen -sy 24 1
nnoremap <leader>s :source /home/abergman/projects/dotfiles/sec.vimrc<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>n "nPgI

let @n=" {{{\n
       \  Username: \n
       \  Password: \n
       \  URL: \n
       \  Comment: \n
       \}}}\n"
function! CopyField( field )
  execute "normal! zv[z"
  execute "silent normal! /" . a:field . "\<CR>"
  execute "normal! ww\"+yiW"
  echo "Copied " . a:field
endfunction

set updatetime=10000
augroup secgroup
  au!
  autocmd CursorHold * :let @+=""|:nohlsearch|echo "Clipboard cleared"
augroup end

"autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif 

