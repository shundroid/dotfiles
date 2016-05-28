if !has("gui_running")
"  set term=xterm
  set t_Co=256

  " カーソルの形状を変える
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

  " lightlineを表示する
  set laststatus=2

"  let &t_AB="\e[48;5;%dm"
"  let &t_AF="\e[38;5;%dm"
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
"set guioptions-=e " gvimでもテキストベースのタブ

"set completeopt=menuone
"for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
"endfor

"map <C-W> :q<CR>

filetype plugin indent off
if &compatible
  set nocompatible
endif
set runtimepath^=~/vimfiles/bundle/neobundle.vim
call neobundle#begin(expand('~/vimfiles/bundle/'))
"NeoBundle 'vim-airline/vim-airline'
"NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim' " Ctrl + N で、ディレクトリ内のファイルを表示
NeoBundle 'Shougo/neomru.vim' " Unite.vim で、「最近表示したファイル」を使う
NeoBundle 'Shougo/neoyank.vim' " Unite.vim で、history/yank
NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'scrooloose/nerdtree' " ファイルをツリー表示してくれる
"NeoBundle 'nathanaelkane/vim-indent-guides' " インデントに色をつけて見やすくする
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Townk/vim-autoclose' " 閉じカッコなどを自動で入力
"NeoBundle 'airblade/vim-gitgutter' " Gitの差分を左端に表示
NeoBundle 'lilydjwg/colorizer' " CSSで色をシンタックスで表示
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mhinz/vim-startify' " 「スタートページ」を表示
"NeoBundle 'jonathanfilip/vim-lucius' " color scheme
"NeoBundle 'sjl/badwolf' " color scheme
NeoBundle 'lambdalisue/unite-grep-vcs'
"NeoBundle 'tetris.vim'
"NeoBundle 'open-browser.vim'
NeoBundle 'marciomazza/vim-brogrammer-theme'
"NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'rust-lang/rust.vim'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/neocomplete', {
"\   'lazy': 1,
"\   'insert': 1
"\ }
" gitk っぽいものを Vim で
"NeoBundle 'cohama/agit.vim', {
"\   'lazy': 1,
"\   'commands': 'Agit',
"\ }
call neobundle#end()
filetype plugin indent on

" emmet-vim
let g:user_emmet_leader_key='<c-t>'

fu! GitAheadBehind()
  let output = system('git branch -vv')
  let ahead = matchstr(output, '\* .*ahead \zs\d\+')
  if ahead != ''
    return '+' . ahead
  end

  let behind = matchstr(output, '\* .*behind \zs\d\+')
  if behind != ''
    return '-' . behind
  end

  return ''
endfu

" vim-airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#tab_nr_type = 1
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#branch#enabled = 0
"let g:airline_powerline_fonts = 1
"let g:airline_theme='durant'
"
"let g:airline_section_b =
"  \ '%{airline#extensions#branch#get_head()}'
"
"fu! AirlineInit()
"  let g:airline_section_b = g:airline_section_b . '%{GitAheadBehind()}'
"endfu
"autocmd BufRead,BufNewFile * call AirlineInit()

" 0でそのタブで開いてるウィンドウ数、1で左のタブから連番
"let g:airline#extensions#tabline#tab_nr_type = 1

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

" lightlineの設定
let g:lightline = {
\ 'colorscheme': 'wombat',
\   'component': {
\     'readonly': '%{&readonly?"x":""}',
\   }
\ }
" Unite.vimの設定
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" NERDTreeの設定
"map <C-N> :NERDTreeToggle<CR>

" vim-indent-guides の設定
let g:indent_guides_enable_on_vim_startup = 1

" vim-gitgutter の設定
"map <C-G> :GitGutterToggle<CR>
"set updatetime=250

" open-browserの設定
let g:netrw_nogx = 1
nmap <Space>x <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" VimShell の設定
let g:vimshell_prompt = $USERNAME . "% "
"let g:vimshell_interactive_encodings = {
"\'git':'utf-8',
"\}

" Agit.vim
"let agit_action = {}
"function! agit_action.func(dir)
"  if isdirectory(a:dir.word)
"    let dir = fnamemodify(a:dir.word, ':p')
"  else
"    let dir = fnamemodify(a:dir.word, ':p:h')
"  endif
"  execute 'Agit --dir=' . dir
"endfunction
"call unite#custom#action('file,cdable', 'agit', agit_action)

" neocomplete
"let g:neocomplete#enable_at_startup = 1

" Space によるキーバインド
" git grep
nnoremap <silent> <Space>gg :Unite grep/git:.<CR>
nnoremap <silent> <Space>p :Unite -buffer-name=file file file/new<CR>
nnoremap <silent> <Space>b :Unite buffer<CR>
nnoremap <silent> <Space>z :Unite file_mru<CR>
nnoremap <silent> <Space>r :Unite file_rec/git<CR>
nnoremap <silent> <Space>n :Unite file/new<CR>
nnoremap <silent> <Space>tt :tabnew<CR>
nnoremap <silent> <Space>th gt<CR>
nnoremap <silent> <Space>tl gT<CR>
nnoremap <silent> <Space>y :Unite history/yank<CR>
nnoremap <silent> <Space>q :q<CR>
nnoremap <silent> <Space>s :VimShellCreate<CR>
nnoremap <silent> <Space>wv <C-w>v<CR>
nnoremap <silent> <Space>ws <C-w>s<CR>
nnoremap <silent> <Space>ww <C-w>w<CR>
nnoremap <silent> <Space>wj <C-w><Down><CR>
nnoremap <silent> <Space>wk <C-w><Up><CR>
nnoremap <silent> <Space>wl <C-w><Right><CR>
nnoremap <silent> <Space>wh <C-w><Left><CR>
nnoremap <silent> <Space>aa :Agit<CR>
nnoremap <silent> <Space>af :AgitFile<CR>
"検索設定のハイライトとその取消
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>


if !has("gui_running")
  colorscheme brogrammer
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

NeoBundleCheck

