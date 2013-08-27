" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader = "\<Space>"

" Installed Plugins {{{
" required for Vundle:
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" My bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'godlygeek/tabular'
Bundle 'bling/vim-airline'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'SirVer/ultisnips'
Bundle 'kien/ctrlp.vim'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'klen/python-mode'
"Bundle 'jcf/vim-latex'
Bundle 'vim-scripts/vimwiki'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'mattn/calendar-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-dispatch'
Bundle 'sjl/gundo.vim'
"Bundle 'a.vim'
Bundle 'dbakker/vim-lint'
Bundle 'rsmenon/vim-mathematica'
Bundle 'christoomey/vim-tmux-navigator'
"new plugins
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
"Bundle 'kana/vim-altr'
"Bundle 'kana/vim-textobj-user'
"Bundle 'rbonvall/vim-textobj-latex'
"Bundle 'b4winckler/vim-angry'
"Bundle repeat
"Bundle vim-sigify
" runtime macros/matchit.vim
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"Bundle 'Lokaltog/powerline'
" }}}

" Basic Vim settings {{{
filetype plugin indent on
syntax on
set background=dark
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_hitrail=1
colorscheme solarized
"colorscheme SolarizedDark_modified
set t_Co=256
set history=10000 
set nowrap
set wildmenu 
set wildmode=list:longest:full
set backspace=indent,eol,start
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set mouse=a
set laststatus=2
                     " tabs
set autoindent
set softtabstop=2
set tabstop=2
set shiftwidth=2     " a tab is two spaces
set expandtab        " use spaces, not tabs
set shiftround
set smarttab
                     " searching
set ignorecase
set smartcase
set incsearch        " do incremental searching
set hlsearch
set title
set number           " show line numbers
set colorcolumn=+1
set winwidth=82
set showmatch        " Show matching brackets
set scrolloff=3
set switchbuf=usetab
set hidden
set autoread
set autowriteall
set gdefault
set undofile
set foldmethod=marker
set spelllang=en_us
set wildignore+=.git
set wildignore+=*.so,*.a,*.la,*.o
set wildignore+=*.swp,*.pyc,*.class
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.aux,*.dvi,*.toc,*.pdf,*.ps
set wildignore+=*.mp3,*.m4a,*.wav,*.flac
set wildignore+=*.mp4,*.avi
set guioptions-=T " no toolbar
set guioptions-=L " no left scrollbar
set guioptions-=r " no right scrollbar
set clipboard+=unnamedplus
set report=0
" }}}

" Mappings {{{
nmap Q gqip " Formats current paragraph
vmap Q gq
nmap <F5> :NERDTreeFind<CR>
" CTRL-U in insert mode deletes a lot.
" Use CTRL-G u to first break undo,  so that you
" can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>  
inoremap jk <esc>
inoremap kj <esc>
nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>l  :nohlsearch<CR><C-L>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>w  :update<CR>
nnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a, :Tabularize /,<CR>
nnoremap <leader>a\<Space> :Tabularize / <CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gg :Ggrep 
nnoremap <leader>/  :Ag 
nnoremap <leader>m  :wall\|make\|redraw!\|cc<CR>
nnoremap <leader>s  :call MySpell()<CR>
nnoremap <leader>b  :CtrlPBuffer<CR>
nnoremap <leader>v  :vertical resize 80<CR>
nnoremap <leader>u  :GundoToggle<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <up>       :lprev<CR>
nnoremap <down>     :lnext<CR>
nnoremap <left>     :cprev<CR>
nnoremap <right>    :cnext<CR>
"These mappings dont work :(
"nnoremap <C-1> 1gt
"nnoremap <C-2> 2gt
"nnoremap <C-3> 3gt
"nnoremap <C-4> 4gt
"nnoremap <C-5> 5gt


" output all currently defined mappings
"redir! > /tmp/vim.map | map | redir END | vsplit /tmp/vim.map 

" http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
" window
" nmap <leader>sw<left>  :topleft  vnew<CR>
" nmap <leader>sw<right> :botright vnew<CR>
" nmap <leader>sw<up>    :topleft  new<CR>
" nmap <leader>sw<down>  :botright new<CR>
" " buffer
" nmap <leader>s<left>   :leftabove  vnew<CR>
" nmap <leader>s<right>  :rightbelow vnew<CR>
" nmap <leader>s<up>     :leftabove  new<CR>
" nmap <leader>s<down>   :rightbelow new<CR>
" }}}

" Plugin Options {{{ 

" Airline {{{
let g:airline_theme='light'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␊ '
"}}}

" LaTex {{{
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_Folding=0
"}}}

" Mathematica {{{
" .m files automatically presumed as Matlab files
" set .m files to associate with Mathematica highlighting
let filetype_m="mma"
let g:mma_highlight_option="solarized"
let g:mma_candy=1
"}}}

" vim {{{
" Auto-Reload vimrc
" http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }
" use the :help command for 'K' in .vim files
autocmd FileType vim set keywordprg=":help"
autocmd FileType help nnoremap <silent><buffer> q :q<CR>
autocmd FileType help wincmd L

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " auto-save after 'updatetime'
  autocmd CursorHold  * :silent! update
  autocmd CursorHoldI * :silent! update

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

augroup localvimrc
  autocmd!
  autocmd BufNewFile,BufReadPost * nested call ReadLocalVimrc()
augroup END

function! ReadLocalVimrc()
  let mylocalvimrc = expand( "%:p:h" ) . "/local.vimrc"
  if filereadable( mylocalvimrc )
    execute "source " . fnameescape( mylocalvimrc )
    echomsg mylocalvimrc . " sourced"
  endif
endfunction

" MySpell()
function! MySpell()
  setlocal spell!
  if &spell
    nnoremap <buffer> k [s
    nnoremap <buffer> j ]s
    nnoremap <buffer> l 1z=
    nnoremap <buffer> h z=
    nnoremap <buffer> g zg
    nnoremap <buffer> w zw
  else
    nunmap <buffer> h
    nunmap <buffer> j
    nunmap <buffer> k
    nunmap <buffer> l
    nunmap <buffer> g
    nunmap <buffer> w
  endif
endfunction
"}}}

" Syntastic {{{
" https://github.com/jdavis/dotfiles/blob/master/.vimrc#L320
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"}}}

" Powerline {{{
"let g:Powerline_symbols = 'fancy'
"}}}

" NERDTree {{{
"autocmd VimEnter * NERDTree | wincmd p
let NERDTreeIgnore = ['\.o$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"}}}

" CScope {{{
if has("cscope")
  "set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif
"}}}

" CtrlP {{{
"let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]levlabnas$' }
let g:ctrlp_show_hidden = 1
"}}}

" vimwiki {{{
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
" }}}

"}}}
