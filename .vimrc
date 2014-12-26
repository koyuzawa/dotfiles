"NeoBundle Scripts------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand("$HOME/.vim/bundle"))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

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

" sublimeみたいな入力
NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'sudo.vim'

" ファイルツリー表示
NeoBundle 'scrooloose/nerdtree'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'



" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set encoding=utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

" for emmet
let g:user_emmet_leader_key='<C-E>'

" for ctrlp
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

syntax enable
colorscheme desert

" for tab key
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" 行数
set number

" カーソル位置の表示
set ruler

" insertモードでbackspaceを使う
set backspace=indent,eol,start

set nowrap

set history=200

" 検索結果のハイライト
set hls

" tab補完候補を一覧表示する
set wildmode=longest,list

" 空白の自動削除
function! s:remove_dust()
  let cursor = getpos(".")
  " 保存時に行末の空白を除去する
  %s/\s\+$//ge
  " 保存時にtabを2スペースに変換する
  %s/\t/  /ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" jjにESCをバインド
inoremap <silent> jj <ESC>

" コマンドモードでUpとDownの
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" バッファ操作
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/':'%%'



" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""



" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

