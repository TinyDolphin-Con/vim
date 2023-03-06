vim9script
# 上述语句最好放在第一行，表示开始使用 vim9 语法

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
#     -> Initialize
#     -> Loading
#
# #############################################################


# #############################################################
# => Initialize 初始化配置
# #############################################################

# 取得本文件所在的目录
var home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
echo home
# 定义一个命令用来加载文件
command! -nargs=1 IncScript exec 'so ' .. fnameescape(home .. '/' .. '<args>')

# 将 vim-init 目录加入 runtimepath
exec 'set rtp+=' .. fnameescape(home)
# 将 ~/.vim_runtime 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
exec 'set rtp+=~/.vim_runtime'

# #############################################################
# => Loading 模块加载
# #############################################################

# 加载基础配置
IncScript vimrcs/basic.vim
# 加载扩展配置
IncScript vimrcs/extended.vim
# 加载插件配置
IncScript vimrcs/plugins_config.vim
# 加载文件配置
IncScript vimrcs/filetypes.vim
