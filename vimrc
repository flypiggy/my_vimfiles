"unite Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Initialize plugin system
call plug#end()

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
set colorcolumn=100

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable "不要自动折叠

set ignorecase "忽略搜索大小写
set smartcase
set mouse=a

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set showbreak=...
set wrap linebreak nolist "自动换行不断开单词
set whichwrap+=<,>,h,l

set t_Co=256
colorscheme molokai
let mapleader = ','

"Sets line relative numbers
set rnu
set cursorline

" add syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

"When move around keep cursor center fo the screen
nnoremap } }zz
nnoremap { {zz
nnoremap n nzz
nnoremap N Nzz
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

"use gj gk instead of jk
nnoremap j gj
nnoremap k gk

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

" Disable q
nnoremap q <nop>
nnoremap Q <nop>

"airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2

"UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"CtrlP
nnoremap <C-m> :CtrlPMRU<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_user_command = {
\    'types': {
\      1: [
\        '.git',
\        'cd %s &&
\         git ls-files . -co --exclude-standard
\         | awk ''{ print length, $0 }''
\         | sort -n -s
\         | cut -d" " -f2-'
\      ],
\    },
\    'fallback': 'find %s -type f'
\  }

"vim-multiple-cursors
let g:multi_cursor_start_key='<F6>'

let g:vim_markdown_folding_disabled=1

"快捷键映
nnoremap <TAB><TAB> :tabnext<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <S-L> :nohls<CR>
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

noremap <F8> :TagbarToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"ale
let g:ale_fixers = {
      \   'javascript': ['prettier'],
      \   'css': ['prettier'],
      \   'ruby': ['prettier']
      \}
let g:ale_fix_on_save = 1

"map language
" autocmd FileType sml map <F5> :!sml % < /dev/null <CR>
" autocmd FileType sml map <F6> :!sml % <CR>
" autocmd FileType sml set ts=4 | set sw=4

"CtrlSF settings
nnoremap <Leader>f :CtrlSF
nnoremap <Leader>t :CtrlSFToggle<CR>
let g:ctrlsf_default_root = 'project'
" let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'spec']
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }

"NERDTree settings
noremap <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.swp$']

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    " if hostname() == "ligan"
    set guifont=Hack\ Nerd\ Font\ Mono:h13
    " else
    "   set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16
    " endif
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

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\t/
