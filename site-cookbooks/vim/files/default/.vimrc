set nocompatible               " be iMproved
filetype off

let g:neobundle_default_git_protocol='https'
let g:alpaca_powertabline_enable=1
let g:Powerline_symbols='fancy'
set t_Co=256
let g:Powerline_symbols='compatible'
set guifont=Ricty\ Regular\ for\ Powerline:h14
set tabline=%!MakeAlpacaTabLine()

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif

filetype plugin indent on     " required!
filetype indent on
syntax on

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

