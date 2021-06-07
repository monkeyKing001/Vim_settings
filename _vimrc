" Vim with all enhancements
filetype off
set shellslash

set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
source $VIMRUNTIME/vimrc_example.vim
colorscheme koehler
set number relativenumber

"indent
set smartindent
set tabstop=4
set expandtab
set et

set guifont=Consolas:h13:cANSI
set guifontwide=Dotumche:h13:cDEFAULT

set encoding=cp949
set fileencodings=utf-8,cp949
set langmenu=cp949
"modifiable

set modifiable
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Leader key keymapping
let mapleader=","
nnoremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>

" Key Setting - resize windows
 nnoremap <silent> <Leader>= :exe "resize +3"<CR>
 nnoremap <silent> <Leader>- :exe "resize -3"<CR>
 nnoremap <silent> <Leader>] :exe "vertical resize +8"<CR>
 nnoremap <silent> <Leader>[ :exe "vertical resize -8"<CR>

 nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
 nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
 nnoremap <silent> <Leader>} :exe "vertical resize " . (winheight(0) * 3/2)<CR>
 nnoremap <silent> <Leader>{ :exe "vertical resize " . (winheight(0) * 2/3)<CR>

"NERDTree
let g:NERDTreeCopyCmd='cp-r'
nmap <Leader>n :NERDTreeToggle<CR>

noremap <C-h> <C-w>h 
noremap <C-j> <C-w>j 
noremap <C-k> <C-w>k 
noremap <C-l> <C-w>l 

noremap <C-F> :NERDTreeFind<cr>

