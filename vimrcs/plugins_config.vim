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
#     -> vim-plug
#
# #############################################################


# #############################################################
# => vim-plug 插件管理器
# #############################################################

# 自动安装 plug.vim
# https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
if empty(glob('~/.vim_runtime/autoload/plug.vim'))
  silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

# The default plugin directory will be as follows:
call plug#begin('~/.vim_runtime/vim-plugs')
#   - Vim (Linux/macOS): '~/.vim/plugged'
#   - Vim (Windows): '~/vimfiles/plugged'
#   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
# You can specify a custom plugin directory by passing it as the argument
#   - e.g. `call plug#begin('~/.vim/plugged')`
#   - Avoid using standard Vim directory names like 'plugin'

# ##### 基础插件 plugin/basic.vim

# ##### ui 插件
# plugin/defx.vim
Plug 'Shougo/defx.nvim' # defx 文件树插件（支持异步）
# :h Defx 需要安装依赖：pip3 install --user pynvim
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ryanoasis/vim-devicons' # defx 文件树图标
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 't9md/vim-choosewin' # 选择在哪个窗口打开（文件树中 i 键）
# plugin/ui.vim
Plug 'Yggdroot/indentLine' # 缩进对齐线

# ##### 颜色主题 plugin/colors.vim
Plug 'morhetz/gruvbox'
# Plug 'octol/vim-cpp-enhanced-highlight'

# ##### 搜索
# plugin/stargate.vim
Plug 'monkoose/vim9-stargate' # 窗口内搜索并快速跳转插件（新版 easymotion）
# plugin/leaderf.vim
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  } # 模糊搜索

# ##### 书签 plugin/bookmake.vim

# ##### 高效编辑
# plugin/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'} # 语法智能补全插件
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
# plugin/ultisnips.vim
Plug 'SirVer/ultisnips' # 代码引擎插件
Plug 'honza/vim-snippets' # 代码片段仓库
# plugin/gutentags.vim
Plug 'ludovicchabant/vim-gutentags' # 自动异步生成 tags
Plug 'skywind3000/gutentags_plus' # 与 gutentags 一起工作，提供无障碍的数据库切换
# plugin/commentary.vim
Plug 'tpope/vim-commentary' # 快速注释代码
Plug 'Eliot00/auto-pairs' # 自动补全括号引号插件
Plug 'kg8m/vim-simple-align', { 'rev': 'vim9' } # vim 对齐插件
# 命令行使用 :{RANGE}SimpleAlign {对齐字符} {OPTIONS}
# :h vim-simple-alig

# ##### C/C++
# Plug 'neomake/neomake' # 代替内置的 make
# Plug 'puremourning/vimspector' # C++ 调试插件
# plugin/ale.vim
Plug 'dense-analysis/ale' # 动态语法检测

# ##### git 管理
# plugin/git.vim
# Plug 'Eliot00/git-lens.vim' # 显示当前行的 commit message（NB：存在问题，会隐藏内容）
Plug 'mhinz/vim-signify' # 实时显示修改状态

# ##### 任务系统
# plugin/asynctasks.vim
Plug 'skywind3000/asynctasks.vim' # 类似 vscode 的任务系统
Plug 'skywind3000/asyncrun.vim' # 异步运行 shell 命令

# ##### 其他
# 自定义状态栏插件（存在问题，暂时不用）
# Plug 'Bakudankun/qline.vim'
# # 需要从以下插件导入颜色方案，但需禁用插件
# Plug 'vim-airline/vim-airline'
# Plug 'vim-airline/vim-airline-themes'
# Plug 'itchyny/lightline.vim'

# Vim 可定制化菜单、列表框、输入框、文本框等（后续探索）
# Plug 'skywind3000/vim-quickui'


# Initialize plugin system
# - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
# You can revert the settings after the call like so:
#   filetype indent off   # Disable file-type-specific indentation
#   syntax off            # Disable syntax highlighting

# 启动时，自动安装缺失插件（NB：需在 call plug#end() 之后配置）
## filter： 如果存在未安装的插件（即不存在的插件目录数 > 0 时），进行安装
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) > 0
  \| PlugInstall --sync | source $MYVIMRC
\| endif

# 加载 ui 配置
IncScript plugin/ui.vim
# 加载 git 配置
IncScript plugin/git.vim
# 加载语法检测配置
IncScript plugin/ale.vim
# 加载语法智能补全配置
IncScript plugin/coc.vim
# 加载文件树配置
IncScript plugin/defx.vim
# 加载基础配置
IncScript plugin/basic.vim
# 加载颜色配置
IncScript plugin/colors.vim
# 加载模糊搜索配置
IncScript plugin/leaderf.vim
# 加载快速跳转配置
IncScript plugin/stargate.vim
# 加载自动生成 tag 配置
IncScript plugin/gutentags.vim
# 加载任务系统配置
IncScript plugin/asynctasks.vim
