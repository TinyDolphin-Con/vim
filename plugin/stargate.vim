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
#     -> monkoose/vim9-stargate
#
# #############################################################

# #############################################################
# => monkoose/vim9-stargate 窗口内搜索并快速跳转插件（新版 easymotion）
# #############################################################

# 对于 1 个字符的搜素，才显示提示
noremap ss <Cmd>call stargate#OKvim(1)<CR>
# 对于连续两个字符的搜索
noremap SS <Cmd>call stargate#OKvim(2)<CR>
# 快速切换窗口
nnoremap sw <Cmd>call stargate#Galaxy()<CR>
