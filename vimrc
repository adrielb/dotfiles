let mapleader = "\<Space>"
" Installed Plugins {{{

function! LoadBundles()
  Plugin 'gmarik/vundle'
  Plugin 'chrisbra/color_highlight'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'tomasr/molokai'
  Plugin 'joedicastro/vim-molokai256'
  Plugin 'sjl/badwolf'
  Plugin 'nielsmadan/harlequin'
  Plugin 'mileszs/ack.vim'
  Plugin 'rking/ag.vim'
  Plugin 'godlygeek/tabular'
  Plugin 'bling/vim-airline'
  "Plugin 'nathanaelkane/vim-indent-guides'
  "Plugin 'SirVer/ultisnips'
  Plugin 'kien/ctrlp.vim'
  "Plugin 'davidhalter/jedi-vim'
  "Plugin 'ervandew/supertab'
  "Plugin 'Valloric/YouCompleteMe'
  Plugin 'klen/python-mode'
  "Plugin 'Python-mode-klen'
  "Plugin 'jcf/vim-latex'
  Plugin 'vim-scripts/vimwiki'
  Plugin 'scrooloose/syntastic'
  Plugin 'scrooloose/nerdcommenter'
  "Plugin 'scrooloose/nerdtree'
  "Plugin 'mattn/calendar-vim'
  Plugin 'gregsexton/gitv'
  Plugin 'tpope/vim-fugitive'
  "Plugin 'tpope/vim-markdown'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-git'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-vinegar'
  Plugin 'tpope/vim-obsession'
  Plugin 'sjl/gundo.vim'
  "Plugin 'a.vim'
  Plugin 'dbakker/vim-lint'
  Plugin 'rsmenon/vim-mathematica'
  "Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'Shougo/neosnippet.vim'
  Plugin 'Shougo/neosnippet-snippets'
  Plugin 'Shougo/neomru.vim'
  Plugin 'jpalardy/vim-slime'
  "Plugin 'ivanov/vim-ipython'
  "new plugins
  "Plugin 'Lokaltog/vim-easymotion'
  Plugin 'LaTeX-Box-Team/LaTeX-Box'
  "Plugin 'vim-pandoc/vim-pantondoc'
  "Plugin 'vim-pandoc/vim-pandoc-syntax'
  "Plugin 'kana/vim-altr'
  "Plugin 'kana/vim-textobj-user'
  "Plugin 'rbonvall/vim-textobj-latex'
  "Plugin 'b4winckler/vim-angry'
  "Plugin repeat
  Plugin 'mhinz/vim-signify'
  Plugin 'justinmk/vim-sneak' 
  Plugin 'AndrewRadev/splitjoin.vim'
  Plugin 'tommcdo/vim-exchange'
  Plugin 'duff/vim-scratch'
  Plugin 'bkad/CamelCaseMotion'
  Plugin 'chrisbra/NrrwRgn'
  Plugin 'vim-scripts/Vim-R-plugin'
  Plugin 'file:///home/abergman/projects/vimtips'
  Plugin 'file:///home/abergman/projects/dotvim'

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
    PluginInstall
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
if has("gui_running" )
  "colorscheme molokai
  "colorscheme badwolf
  colorscheme harlequin
else
  colorscheme molokai256
endif
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
set mouse-=a
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
set sidescrolloff=3
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
set guifont=Droid\ Sans\ Mono\ 12
set guioptions-=m " no menubar
set guioptions-=T " no toolbar
set guioptions-=L " no left scrollbar
set guioptions-=r " no right scrollbar
set shortmess+=I  " no intro msg
set clipboard+=unnamedplus
set report=0
set noesckeys
set listchars=trail:█,tab:>~,eol:¶,extends:»,precedes:«
set fillchars=vert:\|,fold:\_,diff:⣿
set completeopt-=preview
set lazyredraw
set synmaxcol=300
set conceallevel=2
set concealcursor=i
set foldtext=functions#NeatFoldText()
" }}}

" Mappings {{{
" available maps
" nnoremap U gundo or fugitive?
" nnoremap cr change/refactor
" nnoremap gx execute file?
" nnoremap g<Space>
" allows incsearch highlighting for range commands, from /u/romainl 
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>
" highlight last inserted text
noremap  gV `[v`]
nnoremap gs :update<CR>
nnoremap gb :CtrlPBuffer<CR>
nnoremap g/ :<C-U>Unite grep:.:<CR>
nnoremap go :<C-u>Unite directory_mru -start-insert -buffer-name=cd -default-action=cd<CR>
nnoremap gz :<C-u>Unite process -start-insert -buffer-name=processes<CR>
nnoremap gl :<C-u>Unite line -start-insert -buffer-name=lines<cr>
nnoremap gr :<C-u>Unite register -buffer-name=register<CR>
nnoremap gy :<C-u>Unite history/yank<CR>
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
"move to last character
nnoremap - $
xnoremap - $
onoremap - $
nnoremap Q @q
nnoremap Y y$
nnoremap ZZ :wqa<CR>
nnoremap n nzxzz
nnoremap N Nzxzz
" CTRL-U in insert mode deletes a lot.
" Use CTRL-G u to first break undo,  so that you
" can undo CTRL-U after inserting a line break.
    imap <C-f> <Plug>(neosnippet_start_unite_snippet)
inoremap <C-U> <C-G>u<C-U>
nnoremap <C-Q> :botright copen<CR>
nnoremap <C-N> :CtrlPMRU<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
    nmap <C-Space>s :cscope find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>g :cscope find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>c :cscope find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>t :cscope find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>e :cscope find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>f :cscope find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-Space>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-Space>d :cscope find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>t  :silent ! gnome-terminal &<CR>
nnoremap <leader>l  :nohlsearch<CR><C-L>:checktime<CR>
nnoremap <leader>aa :Tabularize<CR>
xnoremap <leader>aa :Tabularize<CR>
nnoremap <leader>a  :Tabularize /
xnoremap <leader>a  :Tabularize /
nnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a\ :Tabularize /\<CR>
nnoremap <leader>a, :Tabularize /,/r0<CR>
xnoremap <leader>a, :Tabularize /,/r0<CR>
nnoremap <leader>a<Space> :Tabularize / /r0<CR>
xnoremap <leader>a<Space> :Tabularize / /r0<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit --verbose<CR>
nnoremap <leader>gg :Ggrep<Space>
nnoremap <leader>gv :Gitv --all<cr>
nnoremap <leader>gV :Gitv! --all<cr>
vnoremap <leader>gV :Gitv! --all<cr>
nnoremap <leader>/  :Ack<Space>
nnoremap <leader>q  :bp\|bd #<CR>
nnoremap <leader>m  :wall\|make\|redraw!\|copen\|cc<CR>
nnoremap <leader>s  :call functions#MySpell()<CR>
nnoremap <leader>v  :vertical resize 80<CR>
nnoremap <leader>u  :GundoToggle<CR>
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
nmap     <leader><CR>         <Plug>SlimeParagraphSend
nmap     <leader><leader><CR> <Plug>SlimeLineSend
xmap     <leader><CR>         <Plug>SlimeRegionSend
nnoremap <up>       :cprev<CR>
nnoremap <down>     :cnext<CR>
nnoremap <left>     :lprev<CR>
nnoremap <right>    :lnext<CR>
nmap     <BS> <Plug>VinegarUp
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                      \ "\<Plug>(neosnippet_jump_or_expand)"
                      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                      \ "\<Plug>(neosnippet_jump_or_expand)"
                      \: "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
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

" Change to Directory of Current file
command! CD cd %:p:h
command! PI PluginInstall!
command! S  Scratch

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis

command! -bang -nargs=* -complete=file AgCB call ag#Ag('grep<bang>',
      \ " --all-types --hidden --ignore-dir=.git " . <q-args> . " ~/projects/codebank" )

command! -nargs=+ -complete=command PrintMessage call functions#PrintMessage(<q-args>)
command! -range=% HighlightRepeats <line1>,<line2>call functions#HighlightRepeats()
" Increase numbers in next line to see more colors.
command! VimColorTest call functions#VimColorTest('vim-color-test.tmp', 12, 16)
command! GvimColorTest call functions#GvimColorTest('gvim-color-test.tmp')

" Sneak {{{
let g:sneak#streak = 1
"}}}

" Pantodoc {{{
let g:pantondoc_formatting_settings="h"
"}}}

" Neocomplete/Neosnippet {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:neosnippet#snippets_directory='~/projects/dotfiles/snippets'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.python = ''
" R (plugin: vim-R-plugin)
"let g:neocomplete#sources#omni#input_patterns.r =
"\ '[[:alnum:].\\]\+'
let g:neocomplete#sources#omni#input_patterns.c =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
  "\'[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

"}}}

" Unite {{{
let g:unite_source_history_yank_enable=1
let g:unite_prompt = '❫ '

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> <c-j>   <plug>(unite_select_next_line)
  imap <buffer> <c-k>   <plug>(unite_select_previous_line)
endfunction

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  " Use pt in unite grep source.
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
        \ '--no-heading --no-color -a -H --smart-case'
  let g:unite_source_grep_recursive_opt = ''
endif
"}}}

" SuperTab {{{
  let g:SuperTabDefaultCompletionType="context"
" }}}

" vim-slime {{{
let g:slime_no_mappings = 1
let g:slime_target="tmux"
let g:slime_paste_file="/dev/shm/slime-paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1.1"}
"}}}

" Python-mode {{{
let g:pymode_rope=0
let g:pymode_folding=0
let g:pymode_lint=0
let g:pymode_doc=1
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
" TODO: enable when in tmux session
augroup tmux
  au!
  autocmd VimEnter,BufEnter * call system( 'tmux rename-window "' . expand('%:t') . '"' )
  autocmd VimLeave          * call system( 'tmux rename-window ""' )
augroup END
autocmd! tmux *

" Auto-Reload vimrc
" http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost vimrc nested source $MYVIMRC
augroup END

" auto-save after 'updatetime'
augroup autoSave
  au!
  "autocmd CursorHold  * :silent! update
  "autocmd CursorHoldI * :silent! update
augroup END

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " search only open buffers
  " :bufdo vimgrepadd searchstring %
  " :bufdo g/searchstring
  " :bufdo AckAdd -n searchstring
  " Bundle 'vim-scripts/GrepCommands'

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  " Also dont do it when the file is a git commit
  autocmd BufReadPost *
    \ if &filetype !~ '^help' && &filetype !~ '^git\c' && line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

augroup localvimrc
  autocmd!
  autocmd VimEnter,BufNewFile,BufReadPost * nested call functions#ReadLocalVimrc()
  autocmd BufWritePost local.vimrc nested :bufdo call functions#ReadLocalVimrc()
augroup END
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
let g:netrw_list_hide = '.swp$,.*\.un~,^\.git/$'
let g:netrw_banner    = 0
let g:netrw_keepdir   = 0
" }}}

" CScope {{{
if has("cscope")
  " use quickfix, - clears, + appends, 0 null
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set cscopetagorder=0 " search cscope db first, then ctags
  set cscopetag        " use :cstag first when using C-]
  set nocscopeverbose
  " add any database in current directory
  if filereadable("cscope.out")
    cscope add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cscope add $CSCOPE_DB
  endif
  set cscopeverbose
endif
"}}}

" CtrlP {{{
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_multiple_files = '2vjr'
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.neocomplete$' }
let g:ctrlp_show_hidden = 1
"let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_mruf_exclude = '/.*/share/vim/.*/doc/.*\|.vim/bundle/.*'
"}}}

" vimwiki {{{
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
" }}}

"}}}
