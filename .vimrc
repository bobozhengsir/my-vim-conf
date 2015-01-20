"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"=========================================================================
set nocompatible				" 关闭 vi 兼容模式
syntax enable
syntax on						" 自动语法高亮
set t_Co=256
colorscheme gruvbox
set background=dark
set number						" 显示行号
set list						" 显示tab 空格
set tabstop=4
set shiftwidth=4				" 设定<< >> 命令移动时宽度为4个空格
set softtabstop=4				" 使得tab键 4 个空格
filetype plugin indent on		" 开启插件
set completeopt=preview,menu    " 代码补全
set completeopt=longest,menu
set autowrite                   " 自动保存
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set ignorecase smartcase		" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch					" 输入搜索内容时就显示搜索结果
set hlsearch					" 搜索时高亮显示被找到的文本
set magic						" 设置魔术
set smartindent					"smartindent cindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start	" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1					" 设定命令行的行数为 1
set laststatus=2				" 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
								" 设置在状态行显示的信息
set foldenable					" 开始折叠
set foldmethod=syntax			" 设置默认折叠, :help fold-methods  :help fold-commonds
set noerrorbells				" 关闭错误信息响铃
set novisualbell				" 关闭使用可视响铃代替呼叫
set whichwrap=b,s,<,>,[,]		"左右光标移动到头时可以自动下移
set hidden						"没有保存的缓冲区可以自动隐藏
set scrolloff=7					"设置光标上下保留的最小的行数
set autoindent					"自动对齐
set ai!							"设置自动缩进
set wildmenu "增强模式的命令行
set listchars=tab:>-,trail:-	"优化显示tab空格， set list 生效

"括号匹配
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i

"使用ALT+[jk]来移动行内容
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
""光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"实现保存操作
nnoremap <F2> :w<CR>
inoremap <F2> <Esc>:w<CR>a

nnoremap <F1> :q<CR>
inoremap <F1> <Esc>:q<CR>

ca tb tabe
"tabe切换
nnoremap <F9> :tabp<CR>
inoremap <F9> <Esc>:tabp<CR>a
nnoremap <F10> :tabn<CR>
inoremap <F10> <Esc>:tabn<CR>a

""inoremap += <space>+=<space><Esc>a
""inoremap -= <space>-=<space><Esc>a
""inoremap = <space>=<space><Esc>a
""inoremap && <space>&&<space><Esc>a
""inoremap || <space>||<space><Esc>a

" winManager插件
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWidth = 25
let g:defaultExplorer = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
inoremap <buffer><F3>  <Esc>:!php -l %<CR>
nnoremap <buffer><F3>  <Esc>:!php -l %<CR>
vmap<C-Z>:s/^/#/<CR>vmapZZ:s/^##*// <CR>
nmap <silent> <F8> :WMToggle<cr>

"###########################
"##       PHP             ##
"###########################
" The php doc plugin
" source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/local/bin/php %<CR>

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!/usr/local/bin/php -l %<CR>

" Do use the currently active spell checking for completion though!
" (I love this feature :-)
set complete+=kspell

" Enable enhanced command line completion.
set wildmenu wildmode=list:full

" Ignore these filenames during enhanced command line completion.
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif " binary images
set wildignore+=*.luac " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files

" Enable completion dictionaries for PHP buffers.
autocmd FileType php set complete+=k~/.vim/dict/PHP.dict

" PHP Autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set ofu=syntaxcomplete#Complete

" You might also find this useful
" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1
let g:php_folding=2

