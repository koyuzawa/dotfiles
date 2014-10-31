"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/home/vagrant/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/vagrant/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimproc.vim', {
      \         'build' : {
      \           'windows' : 'tools\\update-dll-mingw',
      \           'cygwin' : 'make -f make_cygwin.mak',
      \           'mac' : 'make -f make_mac.mak',
      \           'linux' : 'make',
      \           'unix' : 'gmake',
      \         }
      \       }
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

NeoBundle 'mattn/emmet-vim'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

 
 

" for emmet
let g:user_emmet_leader_key='<C-E>'

syntax enable
colorscheme desert

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set number
