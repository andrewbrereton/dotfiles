runtime! debian.vim

" See http://vimdoc.sourceforge.net/htmldoc/options.html
set incsearch nocompatible showmatch ignorecase smartcase scrolloff=5 noai vb t_vb= noerrorbells wildmenu t_Co=256 modeline smarttab
set et ts=4 softtabstop=4 shiftwidth=4
" Assume /bin/sh is posix-compatible (not bourne-compatible)
let g:is_posix=1

" http://vimdoc.sourceforge.net/htmldoc/syntax.html#syntax
syntax on
filetype plugin indent on

" Filetype-specific configuration
au BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf* set ft=nginx
au BufRead,BufNewFile *.jinja set ft=htmljinja
au BufRead,BufNewFile *.textile set ft=textile
au BufRead,BufNewFile *.pp set ft=puppet
au FileType python setlocal et ts=4 softtabstop=4 shiftwidth=4

" Reopen files where we left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Remember for 100 files: 1000 lines per register, but not for files in /mnt or /media or /tmp. Save to ~/.viminfo
set viminfo='100,s1000,r/mnt,r/media,r/tmp,n~/.viminfo

" Theme settings
set bg=dark
colorscheme inkpot
