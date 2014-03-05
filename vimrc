"use neobundle mange the vim plugins
source ~/.vim/NeoBundles.vim

syntax on
filetype plugin indent on

"基本设置
set timeoutlen=300                                  "mapping timeout
set ttimeoutlen=50                                  "keycode timeout
set fdm=manual
set nu  "显示行号
set ts=2  "tab缩进为2
set sw=2
set et  "使用空格替换tab
set hls  "高亮被查找到的文本
set ai  "自动缩进
set showcmd
set encoding=utf-8
set backspace=indent,eol,start

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable "不要自动折叠

set ignorecase "忽略搜索大小写
set smartcase

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set showbreak=...
set wrap linebreak nolist "自动换行不断开单词

set t_Co=256
colorscheme molokai
let mapleader = '.'

nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

"airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"unite
nnoremap <C-p> :Unite -start-insert file_rec/async:!<CR>
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

"快捷键映射
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :tabnext<CR>
nnoremap <S-L> :nohls<CR>
nnoremap Y y$
nnoremap <Leader>f :CtrlSF
"key mapping for window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"map jklh to insertmod
inoremap <C-j> <Up>
inoremap <C-k> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
noremap <F8> :TagbarToggle<CR>

"map language
autocmd FileType sml map <F5> :!sml % < /dev/null <CR>
autocmd FileType sml map <F6> :!sml % <CR>
autocmd FileType sml set ts=4 | set sw=4

"NERDTree settings
noremap <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.swp$']

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
