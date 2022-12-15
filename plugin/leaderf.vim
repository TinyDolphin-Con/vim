vim9script
# 上述语句最好放在第一行，表示开始使用 vim9 语法

#  Maintainer:
# #############################################################
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

# 指定 LeaderF 的工作目录
# # c - 当前工作目录的目录（默认）
# # a - 当前工作目录的最近祖先（包含 g:Lf_RootMarkers 定义的一个目录或文件）
# # A - 当前工作文件的最近祖先（包含 g:Lf_RootMarkers 定义的一个目录或文件）
# # f - 当前文件的目录
# # F - 如果当前工作目录不是当前文件的直系祖先，则使用当前文件的目录作为 LeaderF 的工作目录，否则使用默认值 c
g:Lf_WorkingDirectoryMode = 'AF'
# 设置根目录标记
g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']

# normal 模式下，不显示帮助
g:Lf_HideHelp = 1
# 查找文件名时开启缓存，用 F5 刷新（默认开启，项目比较大时，建议开启）
g:Lf_UseCache = 1
# 禁止使用内存缓存索引
g:Lf_UseMemoryCache = 0
# 不使用 git 或者 hg 作为索引文件的工具
g:Lf_UseVersionControlTool = 0
# 指定用于文件索引的外部工具：rg、pt、ag、find
g:Lf_DefaultExternalTool = 'rg'
# 搜索隐藏文件和目录
g:Lf_ShowHidden = 1

# 查找时忽略以下目录和文件
g:Lf_WildIgnore = {
  'dir': ['.git', '__pycache__', '.DS_Store', '.cache', 'bazel-*'],
  'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  '*.mp3', '*.aac', '*.orig', '*.min.*']
}

# 默认rg参数
g:Lf_RgConfig = [ "--glob=!tags", "--glob=!tags.*" ]
# 将最后一次查找的正则表达式保持到r寄存器中
g:Lf_RgStorePattern = "r"
# 默认使用正则模式
g:Lf_DefaultMode = 'Regex'
# 增加【最近使用】文件列表的容量
g:Lf_MruMaxFiles = 9999
# 显示图标
g:Lf_ShowDevIcons = 1
# 使用两倍 ASCII 字符的宽度
set ambiwidth=double
# 设置缓存路径
g:Lf_CacheDirectory = expand('~/.cache/leaderf')

# 开启弹窗模式
g:Lf_WindowPosition = 'popup'
# 设置分隔符
g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline"  }
# 在弹窗中预览结果
g:Lf_PreviewInPopup = 1
# 设置显示预览的类型
g:Lf_PreviewResult = {
  'File': 0,
  'Tag': 0,
  'Mru': 0,
  'Rg': 0,
  'BufTag': 1,
  'Function': 1,
  'Line': 1,
}

# ledaerf 快捷键
# # <C-R> : 在模糊查询和正则表达式模式间切换
# # <C-F> : 在全路径搜索和名字搜索模式间切换
# # <C-U> : 清除已经打出的字符
# # <C-J>, <C-K> : 在结果列表中移动
# # <C-X>, <C-]> : 上下、左右分屏打开文件
# # <C-T> : 新标签页的形式打开文件
# # <F5>  : 刷新缓存
# # <C-P>    => <Tab>  : 预览选中结果
# # <C-Up>   => <Up>   : 在预览popup窗口里滚动向上
# # <C-Down> => <Down> : 在预览popup窗口里滚动向下
# 设置快捷键
g:Lf_CommandMap = {'<C-P>': ['<Tab>'], '<C-Up>': ['<Up>'], '<C-Down>': ['<Down>']}
# 搜索所有文件
g:Lf_ShortcutF = "<leader>ff"
# 搜索 buffer
g:Lf_ShortcutB = "<leader>fb"
# 搜索最近访问的文件
# noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fm :LeaderfMru<CR>
# 搜索当前 buffer 中的 tag（gtags 或者 ctags 生成的 tag）
# noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>ft :LeaderfBufTag<CR>
# 搜索当前 buffer 中的函数
# noremap <leader>fF :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>fF :LeaderfFunction<CR>
# 搜索所有 buffer 中的函数
noremap <leader>fFa :LeaderfFunctionAll<CR>
# 搜索当前 buffer 中的内容
# noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fl :LeaderfLine<CR>
# 搜索所有 buffer 中的内容
noremap <leader>fla :LeaderfLineAll<CR>
# 搜索所有历史命令
noremap <leader>fhc :LeaderfHistoryCmd<CR>
# 搜索所有帮助文档中的标签
noremap <leader>fh :LeaderfHelp<CR>
# 重复上一次搜索结果
# noremap <leader>fr :<C-U>Leaderf! rg --recall<CR>
noremap <leader>fr :LeaderfRgRecall<CR>

# leaderf + rg 快捷键
# # Boundary 边界：word 全匹配
# 输入正则表达式，进行 rg 搜索
nnoremap <leader>frp <Plug>LeaderfRgPrompt
# 搜索光标所在单词
nnoremap <leader>frl <Plug>LeaderfRgCwordLiteralNoBoundary
vnoremap <leader>frl <Plug>LeaderfRgVisualLiteralNoBoundary
# 搜索光标所在单词（单词全匹配）
nnoremap <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
vnoremap <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
# 在 *.h 和 *.cpp 文件中搜索光标下的单词
nnoremap <Leader>fch :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp -g *.cc", expand("<cword>"))<CR><CR>

# leaderf + gtags
# # 不自动生成 gtags 库
# g:Lf_GtagsAutoGenerate = 0
# # 使用 gutentags 生成的数据库
# g:Lf_GtagsGutentags = 1
# # gutentags 的标签生成目录设置成 leaderf 的标签目录缓存
# g:gutentags_cache_dir = expand(g:Lf_CacheDirectory .. '\.LfCache\gtags')
# # 跳转到定义，相当于 g_Ctrl-]，支持模糊搜索和异步执行
# nnoremap <leader>fgd <Plug>LeaderfGtagsDefinition
# # 跳转到引用
# nnoremap <leader>fgr <Plug>LeaderfGtagsReference
# # 跳转到符号
# nnoremap <leader>fgs <Plug>LeaderfGtagsSymbol
# # 跳转到匹配
# nnoremap <leader>fgg <Plug>LeaderfGtagsGrep

# vnoremap <leader>fgr <Plug>LeaderfGtagsReference
# vnoremap <leader>fgd <Plug>LeaderfGtagsDefinition
# vnoremap <leader>fgs <Plug>LeaderfGtagsSymbol
# vnoremap <leader>fgg <Plug>LeaderfGtagsGrep
