vim9script
# #############################################################
#  Maintainer:
#
#        TinyDolphin
#
#  Awesome_version:
#        Get this config, nice color schemes and lots of plugins!
#
#        Install the awesome version from:
#
#            https://github.com/xxx/xxx
#
#  Modify:
#        Created by TinyDolphin on 2022/12/13
#        Last Modified: 2022/12/13 12:54:36
#
#  Sections:
#     -> General
#     -> VIM user interface
#     -> Colors and Fonts
#     -> Files and backups
#     -> Text, tab and indent related
#     -> Visual mode related
#     -> Moving around, tabs and buffers
#     -> Status line
#     -> Editing mappings
#     -> vimgrep searching and cope displaying
#     -> Spell checking
#     -> Misc
#     -> Helper functions
#
# #############################################################


# #############################################################
# => General 通用设置
# #############################################################

# 语法高亮
syntax enable

# 设定保存历史记录的行数 (默认值: 50 )
set history=500

# 特定的文件类型允许插件文件的载入
#filetype plugin on
# 特定的文件类型载入缩进文件
#filetype indent on

# 设置 leader 键
g:mapleader = "\<space>"

# 快速保存
nnoremap W :w!<cr>
nnoremap Q :q<cr>

# 超级用户权限编辑，出现权限不够无法保存时命令模式输入 :W 即可
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

# 快速保存并退出
nnoremap qw :wq<cr>


# #############################################################
# => VIM user interface 用户界面
# #############################################################

# Vim 窗口的右下角显示当前光标的位置
set ruler
# 显示普通行数
set number
# 显示相对行数
set relativenumber
# 显示 git 状态列
set signcolumn=auto
# 设置自动切换行数显示
augroup CursorLineOnlyInActiveWindow
  autocmd!
  # 离开插入模式时，显示相对行数
  autocmd InsertLeave * setlocal relativenumber signcolumn=auto
  # 进入插入模式时，显示普通行数
  autocmd InsertEnter * setlocal norelativenumber signcolumn=number
  # 进入缓冲区后，显示当前列、相对行数、自动显示标记栏
  autocmd BufEnter * setlocal cursorline relativenumber signcolumn=auto
  # 离开缓冲区后
  autocmd BufLeave * setlocal nocursorline norelativenumber signcolumn=number
augroup END

# 避免中文窗口操作系统中的乱码字符
set langmenu=en

# 中文文档 cn
set helplang=en

# 启用 wildmenu 命令行菜单：Tab 键可显示匹配内容
set wildmenu
# 点击Tab键，将显示可能匹配的文件列表，并使用最长的子串进行补全；
# 再次点击Tab键，可以在wildmenu中遍历匹配的文件列表
set wildmode=list:longest,full
# 在匹配列表中忽略指定类型的文件
set wildignore=*.o,*~,*.pyc

# 设置命令行窗口的高度
set cmdheight=1

# 当缓冲区被抛弃时，它会变成隐藏的
set hidden

# 配置退格键，使得发挥应有的作用
set backspace=eol,start,indent
# 左移键回到上一行的行尾，在行尾用右移键能够到下一行的开头
set whichwrap+=<,>,h,l

# 忽略搜索模式的大小写
set ignorecase
# 智能的判断要不要区分搜索模式大小写（只能在 ignorecase 开启时使用）
set smartcase
# 高亮显示搜索结果
set hlsearch
# 动态显示搜索结果（随着你输入的字符不断更新搜索结果）
set incsearch

# 在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能
set lazyredraw

# 针对正则表达式，开启 magic 模式
set magic

# 高亮显示匹配的括号
set showmatch
# 高亮显示匹配括号的时间（单位：十分之一秒）
set matchtime=15

# 关闭错误警告声音
set noerrorbells
# 关闭错误屏幕闪烁
set novisualbell
# 关闭错误警告声音和闪烁
set vb t_vb=

# 关闭 MacVim 的错误警告声音
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

# 在左边增加一列显示折叠栏
set foldcolumn=1

# 总是显示标签栏（默认：新建标签页才会显示）
set showtabline=2

# 光标距离buffer的顶部或底部保持 5 行距离
set scrolloff=5

# 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\


# 快速打开终端
nnoremap TT :terminal<CR>
# nnoremap <silent> TT <ScriptCmd>ToggleTerminal()<CR>
# 快速切换正常模式（可滚动移动）
tnoremap <Esc> <C-\><C-N>
# 快速隐藏终端
tnoremap <leader>h <C-\><C-N>:q<CR>
# 快速关闭终端
tnoremap <leader>q <C-\><C-N>:q!<CR>


# #############################################################
# => Colors and Fonts 颜色和字体
# #############################################################

# 在 Gnome 终端启用 256色
# if $COLORTERM == 'gnome-terminal'
#   set t_Co=256
# endif

# 开启真彩色模式
# set termguicolors
# 尝试设置主题
colorscheme desert
# 设置背景
set background=dark
# 设置背景透明
hi Normal ctermfg=252 ctermbg=none


# 设置 UTF-8 编码
set encoding=utf8

# 使用 Unix 作为标准文件类型
set ffs=unix,dos,mac


# #############################################################
# => Files, backups and undo 文件、备份和撤销
# #############################################################

# 当文件被其他编辑器修改时，自动加载
set autoread
au FocusGained,BufEnter * :checktime

# 不需要备份文件
set nobackup
# 编辑的时候不需要备份文件
set nowritebackup
# 不创建临时交换文件
set noswapfile
# 不创建撤销件
set noundofile

# 文本折叠
# 开启折叠
set foldenable
# 设置折叠
set foldmethod=marker
# 折叠级别
set foldlevel=0


# #############################################################
# => Text, tab and indent related 文本、制表和缩进相关
# #############################################################

# 使用空格而非制表符
set expandtab
# 将 tab 设置为 2 个空格
set tabstop=2
# 每一级缩进 2 个空格
set shiftwidth=2
# 编辑模式时，一次退格键删除 2 个空格
set softtabstop=2
# 智能 tab ：根据文件中其他缩进空格数来确定一个 tab 的空格数
set smarttab

# 光标超过 80 行时，进行断行
set textwidth=80
# 设置不在单词中断行
set linebreak
# 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#
# 打开断行模块支持汉语
set formatoptions+=mB

# 自动缩进：新增加的行和前一行使用相同的缩进形式
set autoindent
# 自动缩进：每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出括号
set smartindent
# C 语言的缩进（比上述两种更严格，推荐 C 语言开发者使用）
set cindent

# 自动折行：超过屏幕时，自动显示在下一行（并不是真正断行）
set wrap
# 在合适的地方（默认情况：^I!@*-+_;:,./?）进行折行显示
set linebreak
# 将“_”从上述列表移除
set breakat-=_
# 在折行显示处，显示指示信息
set showbreak=->
# NB：折行中上下移动：gj gk


# #############################################################
# => Visual mode related 可视模式相关
# #############################################################

# 选中全文
nnoremap VV <Esc>ggvG<CR>

# 可视模式下，按 * 或 # 搜索当前选择
vnoremap <silent> * :<C-u><ScriptCmd>VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u><ScriptCmd>VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

# 替换当前选中字符
vnoremap <silent> <leader>r :<C-u><ScriptCmd>VisualSelection('replace', '')<CR>?<C-R>=@/<CR><CR>


# #############################################################
# => Moving around, tabs, windows and buffers 移动、标签、窗口和缓冲区
# #############################################################

# 空格映射成 / 搜索
# map <space> /
# Ctrl-空格映射成 ? 反向搜索（Mac 键盘存在冲突，暂不需要）
# map <C-space> ?
# 取消搜索高亮（, + <回车键>）
map <silent> <leader><CR> :nohlsearch<CR>

# 向右切分分屏
set splitright
# 向下切分分屏
set splitbelow
# 切分分屏：右左上下
nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
# 分屏间移动（存在冲突，暂时不需要）
# map <C-k> <C-W>k
# map <C-j> <C-W>j
# map <C-h> <C-W>h
# map <C-l> <C-W>l
# 调整分屏大小（暂时不需要）
# map <leader>sk :res +5<CR>
# map <leader>sj :res -5<CR>
# map <leader>sl :vertical resize-5<CR>
# map <leader>sh :vertical resize+5<CR>

# 当失去焦点或者离开当前的 buffer 的时候保存
set autowrite
autocmd FocusLost,BufLeave * silent! update

# 关闭当前 buffer 缓冲区（但不关闭窗口），第二前缀：b
map <leader>bd :Bclose<CR>:tabclose<CR>gT
# 关闭所有 buffer 缓冲区
map <leader>ba :bufdo bd<CR>
# 切换到下一个 buffer 缓冲区
map <leader>bl :bnext<CR>
# 切换到上一个 buffer 缓冲区
map <leader>bh :bprevious<CR>
# 快速打开一个缓冲区
map <leader>bc :e ~/buffer<cr>

# 管理 tab 标签，第二前缀：t
# 新建标签页
map <leader>tn :tabnew<CR>
# 仅保留当前标签页
map <leader>to :tabonly<CR>
# 关闭当前标签页
map <leader>tc :tabclose<CR>
# 移动当前标签页（:tabmove 1 把当前标签页移动到第 2 的位置，默认移动到最后）
map <leader>tm :tabmove
# 切换到下一个标签页，或命令 gt（ gT 切换到上一个标签页）
map <leader>t<leader> :tabnext<CR>
# <leader>0-9 快速切换tab
noremap <leader>1 :tabnext 1<cr>
noremap <leader>2 :tabnext 2<cr>
noremap <leader>3 :tabnext 3<cr>
noremap <leader>4 :tabnext 4<cr>
noremap <leader>5 :tabnext 5<cr>
noremap <leader>6 :tabnext 6<cr>
noremap <leader>7 :tabnext 7<cr>
noremap <leader>8 :tabnext 8<cr>
noremap <leader>9 :tabnext 9<cr>
noremap <leader>0 :tabnext 10<cr>

# 在当前标签页和上一次访问的标签页之间切换
g:lasttab = 1
nmap <Leader>tl :exe "tabn " .. g:lasttab<CR>
# 离开当前标签页之前，lasttab 记录当前标签页
autocmd TabLeave * g:lasttab = tabpagenr()

# 利用当前缓冲区的路径打开一个新的标签页
# 在同一目录下编辑文件时非常有用
map <leader>te :tabedit <C-r>=expand("%:p:h")<CR>/

# 将 cwd 切换到当前打开的缓冲区的目录下
map <leader>cd :cd %:p:h<cr>:pwd<cr>

# 指定在缓冲区之间切换时的行为
# 直接切换过去，而不是新建一个
set switchbuf=useopen,usetab,newtab

# 打开文件时，返回到最后的编辑位置并且居中显示
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | exe "normal! zz" | endif


# #############################################################
# => Status line 状态栏
# #############################################################

# 右下角显示普通模式下的命令
set showcmd

# 总是显示状态栏
set laststatus=2
# 状态栏样式（由插件 qline.vim 替代）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]


# #############################################################
# => Editing mappings 编辑映射
# #############################################################

# 0 移动到行头，^ 移动到本行第一个非空白字符
map 0 ^

# 插入模式下移动光标
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
# 向后删除
inoremap <C-d> <Delete>

# 移动一行文字：Alt + jk
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z
# 兼容 Mac：Control + jk（NB：iterm2 存在键位冲突）
if has("mac") || has("macunix")
  nmap <C-j> <M-j>
  nmap <C-k> <M-k>
  vmap <C-j> <M-j>
  vmap <C-k> <M-k>
endif

# 保存时删除末尾空白
autocmd BufWritePre *.h,*.cpp,*.cc,*.txt,*.js,*.py,*.wiki,*.sh,*.vim CleanExtraSpaces()

# 设置光标
# set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
# 设置光标样式
if $TERM_PROGRAM =~ "iTerm"
  &t_SI = "\<Esc>]50;CursorShape=1\x7"
  &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
# 1 -> blinking block  闪烁的方块
# 2 -> solid block  不闪烁的方块
# 3 -> blinking underscore  闪烁的下划线
# 4 -> solid underscore  不闪烁的下划线
# 5 -> blinking vertical bar  闪烁的竖线
# 6 -> solid vertical bar  不闪烁的竖线


# #############################################################
# => Spell checking 拼写简称
# #############################################################

# 拼写检查开关 ,ss
map <leader>ss :setlocal spell!<cr>
# 拼写检查相关命令
# ]s 移动到下一个拼写错误处
# [s 移动到上一个拼写错误处
# z= 选择正确的拼写
# zg 添加用户拼写
# zw 删除用户拼写


# #############################################################
# => Misc 其他杂项
# #############################################################

#  切换粘贴模式
map <leader>P :setlocal paste!<CR>

# 当使用命令行时，总是报告文件有几行被修改过
set report=0


# #############################################################
# => Helper functions 帮助方法
# #############################################################

# 可视模式下，针对选择的文本进行相关操作（搜索、替换等）
def VisualSelection(direction: string, extra_filter: string)
  var saved_reg = @"
  execute "normal! vgvy"

  var pattern = escape(@", "\\/.*'$^~[]")
  pattern = substitute(pattern, "\n$", "", "")

  if direction == 'gv'
    CmdLine("Ack '" .. pattern .. "' " )
  elseif direction == 'replace'
    CmdLine("%s" .. '/' .. pattern .. '/')
  endif

  @/ = pattern
  @" = saved_reg
enddef

def CmdLine(str: string)
  feedkeys(":" .. str)
enddef

# 删除缓冲区时不关闭窗口
command! Bclose BufcloseCloseIt()
def BufcloseCloseIt()
  var currentBufNum = bufnr("%")
  var alternateBufNum = bufnr("#")

  if buflisted(alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == currentBufNum
    new
  endif

  if buflisted(currentBufNum)
    execute("bdelete! " .. currentBufNum)
  endif
enddef

# 如果复制模式可用，返回 true
def HasPaste(): string
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
enddef

# 保存时删除末尾空白
def CleanExtraSpaces()
  var save_cursor = getpos(".")
  var old_query = getreg('/')
  silent! :%s/\s\+$//e
  setpos('.', save_cursor)
  setreg('/', old_query)
enddef
