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
#     -> Yggdroot/LeaderF
#
# #############################################################

# #############################################################
# => Yggdroot/LeaderF 模糊搜索
# #############################################################

# normal 模式下，不显示帮助
g:Lf_HideHelp = 1
g:Lf_UseCache = 0
g:Lf_UseVersionControlTool = 0
g:Lf_IgnoreCurrentBufferName = 1

# 显示图标
g:Lf_ShowDevIcons = 1
# 使用两倍 ASCII 字符的宽度
set ambiwidth=double

# 开启弹窗模式
g:Lf_WindowPosition = 'popup'
# 显示弹窗预览结果
g:Lf_PreviewInPopup = 1
g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline"  }
g:Lf_PreviewResult = {
  'File': 0,
  'Tag': 0,
  'Mru': 0,
  'Rg': 0,
  'BufTag': 1,
  'Function': 1,
  'Line': 1,
}

# 上下键进行选取
g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
# 搜索所有文件
g:Lf_ShortcutF = "<leader>ff"
# 搜索 buffer
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
# 搜索最近访问的文件
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
# 搜索标签页
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
# 搜索内容
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
# 搜索函数
noremap <leader>fF :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>

# 在当前缓冲区，搜索光标所在的单词
noremap <leader>frb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
# 在所有缓冲区，搜索光标所在的单词
noremap <leader>fab :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ", expand("<cword>"))<CR>
# 重复上一次搜索结果
noremap <leader>frr :<C-U>Leaderf! rg --recall<CR>
# 在 *.h 和 *.cpp 文件中搜索光标下的单词
noremap <Leader>frg :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp -g *.cc", expand("<cword>"))<CR>
