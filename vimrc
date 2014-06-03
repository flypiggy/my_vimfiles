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
set mouse=a

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set showbreak=...
set wrap linebreak nolist "自动换行不断开单词

set t_Co=256
colorscheme molokai
let mapleader = ','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"剪贴模式
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

"airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"unite
nnoremap <C-p> :Unite -start-insert -prompt-direction="top" file_rec<CR>
nnoremap <Leader>m :Unite -start-insert -prompt-direction="top" file_mru<CR>
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

let g:vim_markdown_folding_disabled=1
"快捷键映
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :tabnext<CR>
nnoremap <S-L> :nohls<CR>
nnoremap <Leader>f :CtrlSF
vnoremap Y "*y"
nnoremap <Leader>p "*p"
nnoremap P "0p"
map <Leader>ch :call SetColorColumn()<CR>

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

nnoremap <F5> :GundoToggle<CR>
noremap <F8> :TagbarToggle<CR>

"map language
" autocmd FileType sml map <F5> :!sml % < /dev/null <CR>
" autocmd FileType sml map <F6> :!sml % <CR>
" autocmd FileType sml set ts=4 | set sw=4

"NERDTree settings
noremap <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.swp$']

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    set lines=999 columns=999
    set guioptions-=r
    set guioptions-=L
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
"对齐线
function! SetColorColumn()
  let col_num = virtcol(".")
  let cc_list = split(&cc, ',')
  if count(cc_list, string(col_num)) <= 0
    execute "set cc+=".col_num
  else
    execute "set cc-=".col_num
  endif
endfunction
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
