" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader = "\<Space>"
" Installed Plugins {{{

function! LoadBundles()
  Bundle 'gmarik/vundle'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'tomasr/molokai'
  Bundle 'joedicastro/vim-molokai256'
  Bundle 'mileszs/ack.vim'
  Bundle 'rking/ag.vim'
  Bundle 'godlygeek/tabular'
  Bundle 'bling/vim-airline'
  "Bundle 'nathanaelkane/vim-indent-guides'
  "Bundle 'SirVer/ultisnips'
  Bundle 'kien/ctrlp.vim'
  "Bundle 'davidhalter/jedi-vim'
  "Bundle 'ervandew/supertab'
  "Bundle 'Valloric/YouCompleteMe'
  Bundle 'klen/python-mode'
  "Bundle 'Python-mode-klen'
  "Bundle 'jcf/vim-latex'
  "Bundle 'vim-scripts/vimwiki'
  Bundle 'scrooloose/syntastic'
  Bundle 'scrooloose/nerdcommenter'
  "Bundle 'scrooloose/nerdtree'
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
  "Bundle 'christoomey/vim-tmux-navigator'
  Bundle 'Shougo/unite.vim'
  Bundle 'Shougo/vimproc.vim'
  Bundle 'Shougo/neocomplete.vim'
  Bundle 'jpalardy/vim-slime'
  "Bundle 'ivanov/vim-ipython'
  "new plugins
  "Bundle 'Lokaltog/vim-easymotion'
  Bundle 'LaTeX-Box-Team/LaTeX-Box'
  "Bundle 'kana/vim-altr'
  "Bundle 'kana/vim-textobj-user'
  "Bundle 'rbonvall/vim-textobj-latex'
  "Bundle 'b4winckler/vim-angry'
  "Bundle repeat
  Bundle 'mhinz/vim-signify'
  " runtime macros/matchit.vim
  "set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
  "Bundle 'Lokaltog/powerline'
endfunction

" Install Vundle {{{
" https://github.com/docwhat/homedir-vim/blob/master/vimrc/.vimrc#L355
" Only install vundle and bundles if git exists...
" required for Vundle:
filetype off
if executable("git")
  if !isdirectory(expand("~/.vim/bundle/vundle"))
    echomsg "******************************"
    echomsg "Installing Vundler..."
    echomsg "******************************"
    !mkdir -p ~/.vim/bundle && git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    let s:bootstrap=1
  endif

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  call LoadBundles()

  if exists("s:bootstrap") && s:bootstrap
    unlet s:bootstrap
    BundleInstall
    quit
  endif
endif
"}}}
" }}}

" Basic Vim settings {{{
filetype plugin indent on
syntax on
set background=dark
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_hitrail=1
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai256
hi MatchParen ctermfg=231
"let g:molokai_original=1
"let g:rehash256=1
set t_Co=256
set history=10000
set nowrap
set wildmenu 
set wildmode=list:longest:full
set backspace=indent,eol,start
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set mouse=nichr
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
set nowrapscan " don't loop to beginning
set smartcase
set incsearch        " do incremental searching
set hlsearch
set title
set number           " show line numbers
set relativenumber
set colorcolumn=+1
"set cursorline
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
set wildignore+=*.sw?,*.un~,*.pyc,*.class
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.aux,*.dvi,*.toc,*.pdf,*.ps
set wildignore+=*.mp3,*.m4a,*.wav,*.flac
set wildignore+=*.mp4,*.avi
set guioptions-=T " no toolbar
set guioptions-=L " no left scrollbar
set guioptions-=r " no right scrollbar
set clipboard+=unnamedplus
set report=0
set noesckeys
" }}}

" Mappings {{{
nmap Q gqip " Formats current paragraph
vmap Q gq
"nmap <F5> :NERDTreeFind<CR>
" CTRL-U in insert mode deletes a lot.
" Use CTRL-G u to first break undo,  so that you
" can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"using xcape now
"inoremap jk <esc>
"inoremap kj <esc>
"inoremap kk <esc>
"inoremap jj <esc>
nnoremap Y y$
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>l  :nohlsearch<CR><C-L>
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>w  :update<CR>
nnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a, :Tabularize /,<CR>
nnoremap <leader>a<Space> :Tabularize / /r0<CR>
xnoremap <leader>a<Space> :Tabularize / /r0<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gg :Ggrep<Space>
nnoremap <leader>/  :Ag<Space>
nnoremap <leader>/c :tabnew<CR>:AgCB<Space>
nnoremap <leader>q  :bp\|bd #<CR>
nnoremap <leader>m  :wall\|make\|redraw!\|copen\|cc<CR>
nnoremap <leader>s  :call MySpell()<CR>
nnoremap <leader>b  :CtrlPBuffer<CR>
nnoremap <leader>v  :vertical resize 80<CR>
nnoremap <leader>u  :GundoToggle<CR>
nnoremap <leader>k  :Unite history/yank<CR>
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
nmap     <leader><CR>  <Plug>SlimeParagraphSend
xmap     <leader><CR>  <Plug>SlimeRegionSend
nmap     <leader><leader><CR>  <Plug>SlimeLineSend
"These mappings dont work :(
"nnoremap <C-1> 1gt
"nnoremap <C-2> 2gt
"nnoremap <C-3> 3gt
"nnoremap <C-4> 4gt
"nnoremap <C-5> 5gt


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

command! -bang -nargs=* -complete=file AgCB call ag#Ag('grep<bang>',
      \ " --all-types --hidden --ignore-dir=.git " . <q-args> . " ~/projects/codebank" )

" Neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"}}}

" Unite {{{
let g:unite_source_history_yank_enable=1
"}}}

" SuperTab {{{
  let g:SuperTabDefaultCompletionType="context"
" }}}

" vim-slime {{{
let g:slime_target="tmux"
let g:slime_paste_file="/dev/shm/slime-paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1.1"}
"}}}

" Python-mode {{{
let g:pymode_rope=0
let g:pymode_folding=0
let g:pymode_lint=0
let g:pymode_doc=0
let g:pymode_run=0
let g:pymode_breakpoint=1

" }}}

" Airline {{{
let g:airline_theme='light'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␊ '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
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
autocmd FileType qf   nnoremap <silent><buffer> q :q<CR> 

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

" auto-save after 'updatetime'
augroup autoSave
  au!
  "autocmd CursorHold  * :silent! update
  "autocmd CursorHoldI * :silent! update
augroup END

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
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

" output all currently defined mappings
function! PrintMappings()
  execute "redir! > /tmp/map.vim"
  execute "silent verbose map"
  execute "redir END"
  execute "tabnew /tmp/map.vim"
endfunction

"http://vim.wikia.com/wiki/Capture_ex_command_output
function! PrintMessage(cmd)
  redir => mymessage
  silent execute a:cmd
  redir END
  tabnew
  silent put=mymessage
  setlocal nomodifiable
  setlocal filetype=vim
  setlocal buftype=nofile
endfunction
command! -nargs=+ -complete=command PrintMessage call PrintMessage(<q-args>)

augroup localvimrc
  autocmd!
  autocmd VimEnter,BufNewFile,BufReadPost * nested call ReadLocalVimrc()
  autocmd BufWritePost local.vimrc nested :bufdo call ReadLocalVimrc()
augroup END

function! ReadLocalVimrc()
  let mylocalvimrc = expand( "%:p:h" ) . "/local.vimrc"
  if filereadable( mylocalvimrc )
    execute "source " . fnameescape( mylocalvimrc )
    echo mylocalvimrc . " sourced"
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

" Syntax colors duplicate lines
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

"}}}

" Syntastic {{{
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': [] }
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
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"}}}

" netrw {{{
let g:netrw_liststyle = 1
let g:netrw_list_hide ='.swp$,.*\.un~,^\.git/$'
let g:netrw_banner    = 0
" }}}

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
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]levlabnas$' }
let g:ctrlp_show_hidden = 1
let g:ctrlp_root_markers = ['.ctrlp']
"}}}

" vimwiki {{{
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
" }}}

"}}}
