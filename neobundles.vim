if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'tpope/vim-rails'
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

"补全括号
NeoBundle 'Raimondi/delimitMate'

NeoBundle 'majutsushi/tagbar'
"语法类
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'kchmck/vim-coffee-script'

"markdown 支持
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'itspriddle/vim-marked'

call neobundle#end()
