set cryptmethod=blowfish
autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif 
set noswapfile
set nowritebackup
set viminfo= 
set nobackup
set noshelltemp
set history=0
set secure

