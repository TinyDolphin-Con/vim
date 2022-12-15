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
#     -> Yggdroot/indentLine
#     -> skywind3000/vim-preview
#
# #############################################################

# #############################################################
# => Yggdroot/indentLine 缩进对齐线
# #############################################################

# 设置缩进对齐线的颜色
g:indentLine_color_term = 239
# 设置缩进对齐线的样式
# g:indentLine_char = '┆'


# #############################################################
# => Yggdroot/indentLine 缩进对齐线
# #############################################################

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
