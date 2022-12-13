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
#     -> dense-analysis/ale
#
# #############################################################

# #############################################################
# => dense-analysis/ale 动态语法检测
# #############################################################

# 配合 coc.nvim 一起使用
g:ale_disable_lsp = 1

# 仅运行 linters 的设置
g:ale_linters_explicit = 1
# 完成输入后，ale 请求服务器的延迟（单位：毫秒）
g:ale_completion_delay = 500
# ale 响应的延迟（单位：毫秒）
g:ale_echo_delay = 100
# 文本更改后，运行 linter 的延迟（单位：毫秒）
g:ale_lint_delay = 1000
# 定义回显的消息格式
g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'

# 如果 normal 模式下文字改变以及离开 insert 模式的时候运行 linter
g:ale_lint_on_text_changed = 'normal'
g:ale_lint_on_insert_leave = 1

# 配合 vim-airline 使用
g:airline#extensions#ale#enabled = 1

g:ale_linters = {
  'c': ['gcc', 'cppcheck'],
  'cpp': ['gcc', 'cppcheck'],
  'python': ['flake8', 'pylint'],
  'lua': ['luac'],
  'go': ['go build', 'gofmt'],
  'java': ['javac'],
  'javascript': ['eslint'],
}

# 编译参数
g:ale_c_gcc_options = '-Wall -O2 -std=c99'
g:ale_cpp_gcc_options = '-Wall -O2 -std=c++20'
g:ale_c_clang_options = '-Wall -O2'
g:ale_cpp_clang_options = '-Wall -O2 '
g:ale_c_cc_options = '-Wall -std=c99'
g:ale_cpp_cc_options = '-Wall -std=c++20'

if executable('gcc') == 0 && executable('clang')
  g:ale_linters.c += ['clang']
  g:ale_linters.cpp += ['clang']
endif

# cppcheck 参数
g:ale_c_cppcheck_options = ''
g:ale_cpp_cppcheck_options = ''

# 符号栏始终打开
g:ale_sign_column_always = 1
# 警告和错误符号
g:ale_sign_error = '>>'
g:ale_sign_warning = '--'
# 设置高亮
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

