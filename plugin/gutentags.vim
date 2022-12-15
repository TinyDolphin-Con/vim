vim9script
# 上述语句最好放在第一行，表示开始使用 vim9 语法

# #############################################################
#  Maintainer:
#
#        TinyDolphin
#
#  Description:
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
#     -> ludovicchabant/vim-gutentags
#     -> skywind3000/gutentags_plus
#
# #############################################################


# #############################################################
# => ludovicchabant/vim-gutentags 自动异步生成 tags
# => skywind3000/gutentags_plus 与 gutentags 一起工作，提供无障碍的数据库切换
# #############################################################

# 使用：
#   C-] 当前窗口里跳转到定义; C-o 跳回原来位置
#   C-W ] 新窗口打开并查看光标下符号的定义（建议使用）
#   C-W } 使用 preview 窗口预览光标下符号的定义

g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', '.tags']
# gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归

# 所生成的数据文件的名称
g:gutentags_ctags_tagfile = '.tags'

# 同时开启 ctags 和 gtags 支持：
g:gutentags_modules = []
if executable('ctags')
  g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  g:gutentags_modules += ['gtags_cscope']
endif

# 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
if exists('g:gutentags_cache_dir') == 0
  g:gutentags_cache_dir = expand('~/.cache/tags')
endif
# 检测 ~/.cache/tags 不存在就新建
if !isdirectory(g:gutentags_cache_dir)
	call mkdir(g:gutentags_cache_dir, 'p')
endif

# 配置 ctags 的参数
g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
g:gutentags_ctags_extra_args += ['--c-kinds=+px']

# 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
if has('win32') || has('win16') || has('win64') || has('win95')
  g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif

# 禁用 gutentags 自动加载 gtags 数据库的行为
g:gutentags_auto_add_gtags_cscope = 0
# 定义一些高级命令，例如：GutentagsToggleEnabled 和 GutentagsUnlock
g:gutentags_define_advanced_commands = 1

# 搜索后将焦点转移到快速修复窗口
g:gutentags_plus_switch = 1

# 禁用默认快捷键
g:gutentags_plus_nomap = 1
# 自定义快捷键
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>
# gs # 查看光标下符号的引用
# gg # 查看光标下符号的定义
# gc # 查看光标下的函数被哪些函数调用了
# gt # 查找光标下的文本字符串
# ge # 查找光标下的正则表达式
# gf # 查找光标下的文件
# gi # 查找光标下的文件名被哪些文件 #include
# gd # 查找光标下的函数调用的函数
# ga # 查找光标下的符号被赋值的地方
# gz # 查找光标下的符号（在 ctags 数据库中）
