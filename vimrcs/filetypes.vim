vim9script
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
#     -> C++ section
#     -> python section
#     -> shell section
#     -> Markdown
#
# #############################################################


# #############################################################
# => C++ section
# #############################################################

# 为 C++ 添加注释
autocmd FileType c,cpp set foldmethod=indent nofoldenable
# 设置注释风格
autocmd FileType c,cpp set commentstring=//\ %s


# #############################################################
# => Python section
# #############################################################

# 为 python 添加注释
autocmd FileType python set foldmethod=indent nofoldenable
autocmd FileType python set commentstring=#\ %s
autocmd FileType python syn keyword pythonDecorator True None False self

autocmd BufNewFile,BufRead SConstruct set filetype=python
autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
autocmd BufNewFile,BufRead *.mako set ft=mako

autocmd FileType python map <buffer> F :set foldmethod=indent<cr>

# au FileType python inoremap <buffer> !r return
# au FileType python inoremap <buffer> !i import
# au FileType python inoremap <buffer> !p print
# au FileType python inoremap <buffer> !f # --- <esc>a
# au FileType python map <buffer> <leader>1 /class
# au FileType python map <buffer> <leader>2 /def
# au FileType python map <buffer> <leader>C ?class
# au FileType python map <buffer> <leader>D ?def


# #############################################################
# => Shell section
# #############################################################


# #############################################################
# => Markdown
# #############################################################

autocmd BufNewFile,BufRead *.Md set filetype=markdown
