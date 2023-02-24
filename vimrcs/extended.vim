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
#     -> GUI related
#     -> Fast editing and reloading of vimrc configs
#     -> Turn persistent undo on
#     -> Command mode related
#     -> Parenthesis/bracket
#     -> General abbreviations
#     -> Ack searching and cope displaying
#     -> Misc
#     -> Helper functions
#
# #############################################################


# #############################################################
# => GUI related 图形化相关
# #############################################################

# 图形化界面，根据系统设置字体
if has("mac") || has("macunix")
  set guifont=JetBrainsMono\ Nerd\ Font:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
  set guifont=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
  set guifont=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
  set guifont=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
  set guifont=Monospace\ 11
endif

# 在图形化界面运行时，禁用滚动条
# 隐藏工具栏
set guioptions-=T
# 隐藏编辑器右侧的滚动条
set guioptions-=r
# 隐藏窗口垂直分隔时，编译器右侧的滚动条
set guioptions-=R
# 隐藏编辑器左侧的滚动条
set guioptions-=l
# 隐藏窗口垂直分隔时，编译器左侧的滚动条
set guioptions-=L
# 隐藏编辑器底部的滚动条
set guioptions-=b
set t_Co=256
set guitablabel=%M\ %t


# #############################################################
# => Fast editing and reloading of vimrc configs 快速编辑和重新加载 vimrc 自定义配置
# #############################################################

# 快速编辑 init.vim
map <leader>v :e! ~/.vim_runtime/init.vim<CR>
# ~/.vim_runtime 目录下任何文件存在修改，即可重新加载配置（暂时弃用，影响插件使用）
# echom 输出信息，可通过 :messages 查看
# redraw 立刻重画屏幕
# autocmd! BufWritePost ~/.vim_runtime/* source ~/.vimrc | echom "Reloaded " .. $MYVIMRC | redraw


# #############################################################
# => Turn persistent undo on  开启持久性撤销功能
#    意味着即使关闭了缓冲区/Vim，重新进入时仍能执行撤销操作
# #############################################################

# 设置撤销操作的持久化路径（若目录不存在，需创建目录）
set undodir=~/.vim_runtime/temp_dirs/undodir
set undofile


# #############################################################
# => Command mode related 命令模式相关
# #############################################################

# 命令行上的智能映射
cnoremap `v e ~/.vimrc
# cnoremap `w e ~/workspace
# cnoremap `d e ~/workspace/dev

# 命令行中类似 Bash 的按键
cnoremap <C-A>          <Home>
cnoremap <C-E>          <End>
cnoremap <C-K>          <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


# #############################################################
# => Parenthesis/bracket 小括号/括号
# #############################################################

# 可视模式下，针对选中内容，增加括号
vnoremap `( <esc>`>a)<esc>`<i(<esc>
vnoremap `[ <esc>`>a]<esc>`<i[<esc>
vnoremap `{ <esc>`>a}<esc>`<i{<esc>
vnoremap `' <esc>`>a'<esc>`<i'<esc>
vnoremap `" <esc>`>a"<esc>`<i"<esc>
vnoremap `` <esc>`>a`<esc>`<i`<esc>

# inoremap $1 ()<esc>i
# inoremap $2 []<esc>i
# inoremap $3 {}<esc>i
# inoremap $4 {<esc>o}<esc>O
# inoremap $q ''<esc>i
# inoremap $e ""<esc>i


# #############################################################
# => General abbreviations 通用缩略语
# #############################################################

# 插入模式，快速打印当前时间
iab xdate <C-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>


# #############################################################
# => Ack searching and cope displaying  Ack 搜索和显示
#    需要安装 ack.vim
# #############################################################


# #############################################################
# => Misc 其他杂项
# #############################################################

# 暂时使用 asyncrun.vim 代替
# nnoremap <F9> <Esc>:call CompileRun()<CR>
# inoremap <F9> <Esc>:call CompileRun()<CR>
# vnoremap <F9> <Esc>:call CompileRun()<CR>


# #############################################################
# => Helper functions 帮助方法
# #############################################################

# 一键编译运行
def g:CompileRun()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -Wall -lpthread -g -std=c11 -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ -Wall -lstdc++ -lpthread -g -std=c++2a -D DEBUG_SWITCH % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
  elseif &filetype == 'sh'
    exec "!time zsh %"
    #exec "!time bash %"
  elseif &filetype == 'python'
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!google-chrome % &"
  elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
  elseif &filetype == 'matlab'
    exec "!time octave %"
  endif
enddef
