if !has("gui_running")
  set t_Co=256
  " カーソルの形状を変える
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
  " lightlineを表示する
  set laststatus=2
endif
"set shellslash

set encoding=utf-8
"set fileformats=unix,dos,mac
set fileformat=unix
set fileencodings=utf-8

set foldmethod=indent " 折りたたみ。indentの数で折りたたむ

set directory=~/vimfiles/tmp
set backupdir=~/vimfiles/tmp
set viminfo+=n~/vimfiles/tmp/viminfo.txt " オンにすると、vim-startupができない
set undodir=~/vimfiles/tmp

let mapleader = "\<Space>"

"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk

set clipboard=unnamed,autoselect " yank -> クリップボード

" タブ系の設定
"set showtabline=2

filetype plugin indent off
if &compatible
  set nocompatible
endif
set runtimepath^=~/vimfiles/bundle/neobundle.vim
call neobundle#begin(expand('~/vimfiles/bundle/'))
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim' " Ctrl + N で、ディレクトリ内のファイルを表示
NeoBundle 'Shougo/neomru.vim' " Unite.vim で、「最近表示したファイル」を使う
NeoBundle 'Shougo/neoyank.vim' " Unite.vim で、history/yank
NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Townk/vim-autoclose' " 閉じカッコなどを自動で入力
"NeoBundle 'airblade/vim-gitgutter' " Gitの差分を左端に表示
NeoBundle 'lilydjwg/colorizer' " CSSで色をシンタックスで表示
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mhinz/vim-startify' " 「スタートページ」を表示
NeoBundle 'lambdalisue/unite-grep-vcs'
NeoBundle 'vim-scripts/Sift'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'kana/vim-tabpagecd'

"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'

NeoBundleLazy 'Shougo/vimfiler.vim', {
\   'autoload': { 'commands': [ 'VimFiler', 'VimFilerBufferDir' ] },
\   'depends': [ 'Shougo/unite.vim' ]
\ }

NeoBundle 'othree/html5.vim'
"NeoBundleLazy 'othree/html5.vim', {
"\   'autoload': { 'filetypes': [ 'html' ] }
"\ }

call neobundle#end()
filetype plugin indent on

" emmet-vim
let g:user_emmet_leader_key='<c-t>'

" lightlineの設定
let g:lightline = {
\   'colorscheme': 'wombat',
\   'component': {
\     'readonly': '%{&readonly?"⭤":""}'
\   },
\   'separator': { 'left': '⮀', 'right': '⮂' },
\   'subseparator': { 'left': '⮁', 'right': '⮃' }
\ }
" Unite.vimの設定
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" vim-jsonの設定
let g:vim_json_syntax_conceal = 0

" neocomplete
let g:neocomplete#enable_at_startup = 1

" VimFiler
" gvim . などで起動したとき、netrw でなく vimfilerを起動する
let g:vimfiler_as_default_explorer = 1

" Space によるキーバインド
" git grep
nnoremap <silent> <Space>gg :Unite grep/git:.<CR>
nnoremap <silent> <Space>p :Unite -buffer-name=file file file/new<CR>
nnoremap <silent> <Space>b :Unite buffer<CR>
nnoremap <silent> <Space>z :Unite file_mru<CR>
nnoremap <silent> <Space>r :Unite file_rec/git<CR>
nnoremap <silent> <Space>n :Unite file/new<CR>
nnoremap <silent> <Space>tt :tabnew<CR>
nnoremap <silent> <Space>tl gt<CR>
nnoremap <silent> <Space>th gT<CR>
nnoremap <silent> <Space>y :Unite history/yank<CR>
nnoremap <silent> <Space>q :q<CR>
nnoremap <silent> <Space>wv <C-w>v<CR>
nnoremap <silent> <Space>ws <C-w>s<CR>
nnoremap <silent> <Space>ww <C-w>w<CR>
nnoremap <silent> <Space>wj <C-w><Down><CR>
nnoremap <silent> <Space>wk <C-w><Up><CR>
nnoremap <silent> <Space>wl <C-w><Right><CR>
nnoremap <silent> <Space>wh <C-w><Left><CR>
nnoremap <silent> <Space>v :VimFiler -split -simple -toggle -winwidth=45 -no-quit<CR>
" .vimrcへ記述
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

"検索設定のハイライトとその取消
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>


if !has("gui_running")
  colorscheme sift
end

set number
set title
set showmatch
syntax on
set expandtab
set tabstop=2
set shiftwidth=2
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
set smartindent
set cursorline

NeoBundleCheck

