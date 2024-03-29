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
#     -> octol/vim-cpp-enhanced-highlight
#     -> luochen1990/rainbow
#
# #############################################################


# 设置主题（透明背景）
colorscheme gruvbox
colorscheme habamax
colorscheme lunaperche
colorscheme murphy
# 设置背景透明
hi Normal ctermfg=252 ctermbg=none

# 设置主题（非透明背景）
colorscheme habamax
colorscheme slate
colorscheme gruvbox

# #############################################################
# => octol/vim-cpp-enhanced-highlight C++ 语法高亮（增强）
# #############################################################

# 类范围
g:cpp_class_scope_highlight = 1
# 成员变量
g:cpp_member_variable_highlight = 1
# 声明中类名
g:cpp_class_decl_highlight = 1
# POSIX 函数
g:cpp_posix_standard = 1
# 模板函数
g:cpp_experimental_simple_template_highlight = 1
# 文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
# g:cpp_experimental_template_highlight = 1
# 库概念：关键字以及所有命名的关键字
g:cpp_concepts_highlight = 1
# 若 Vim 将大括号标记为错误，以下配置可解
# c_no_curly_error=1


# #############################################################
# => luochen1990/rainbow 彩虹括号
# #############################################################
g:rainbow_active = 1
g:rainbow_conf = {
	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	'operators': '_,_',
	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	'separately': {
		'*': {},
		'tex': {
			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
		},
		'lisp': {
			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
		},
		'vim': {
			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			},
			'html': {
				'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|' .. "'" .. '[^' .. "'" .. ']*' .. "'" .. '|[^ ' .. "'" .. '"><=`]*))?)*\>/ end=#</\z1># fold'],
			},
			'css': 0,
			'nerdtree': 0,
		}
	}
