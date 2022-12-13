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
#     -> skywind3000/asynctasks.vim
#     -> skywind3000/asyncrun.vim
#
# #############################################################

# #############################################################
# => skywind3000/asynctasks.vim 类似 vscode 的任务系统
# #############################################################

# 将终端放到 tab 中
# g:asynctasks_term_pos = 'tab'

# 自动打开 quickfix window ，高度为 10
g:asyncrun_open = 10

# 设置 <leader>qf 打开/关闭 Quickfix 窗口
nnoremap <leader>qf :call asyncrun#quickfix_toggle(10)<cr>

# 设置项目根目录标志
g:asyncrun_rootmarks = ['.svn', '.git', '.root', '.hg', '.project', '.tags']

# F4 使用 cmake 生成 Makefile 文件
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake .. <cr>

# F6 项目：编译
nnoremap <silent> <F6> :AsyncRun -cwd=<root> make <cr>

# F7 项目：运行
nnoremap <silent> <F7> :AsyncRun -cwd=<root> -raw make run <cr>

# F8 项目：测试
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make test <cr>

# F9 编译单个文件
nnoremap <silent> <F9> :AsyncRun clang -Wall -lstdc++ -lpthread -g -std=c++20 -D DEBUG_SWITCH -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
# F10 运行
# "-cwd=$(VIM_FILEDIR)" ：在文件文件的所在目录运行可执行（可执行使用全路径）
# "-raw" 输出不用匹配错误检测模板 (errorformat) ，直接原始内容输出到 quickfix 窗口
nnoremap <silent> <F10> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
