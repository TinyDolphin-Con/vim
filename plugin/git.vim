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
#     -> Eliot00/git-lens.vim
#     -> mhinz/vim-signify
#
# #############################################################


# #############################################################
# => Eliot00/git-lens.vim 显示当前行的 commit（存在问题，暂不使用）
# #############################################################

# 启用插件（默认未开启）
# g:GIT_LENS_ENABLED = true


# #############################################################
# => mhinz/vim-signify 实时显示修改状态
# #############################################################

# 默认 4000ms
set updatetime=100

# 修改块之间跳转
nmap <leader>sn <plug>(signif-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

# 选中当前修改块的文本
omap <leader>smi <plug>(signify-motion-inner-pending)
xmap <leader>smi <plug>(signify-motion-inner-visual)
# omap <leader>smo <plug>(signify-motion-outer-pending)
# xmap <leader>smo <plug>(signify-motion-outer-visual)

# 启用 Signify 侧边栏（默认启用）
nnoremap <leader>st :SignifyToggle<CR>
# 启用 Signify 代码块高亮
nnoremap <leader>sth :SignifyToggleHighlight<CR>
# 刷新 Signify 标记
nnoremap <leader>sr :SignifyRefresh<CR>
# 相当于 git diff --no-color --no-ext-diff -U0 --
nnoremap <leader>sD :SignifyDebug<CR>

# 显示 Diff 信息
## 对比整个文件 diff
nnoremap <leader>sd :SignifyDiff<cr>
## 对比当前修改块 diff
nnoremap <leader>shd :SignifyHunkDiff<cr>
## 去掉当前修改块的代码
nnoremap <leader>shu :SignifyHunkUndo<cr>

# 配色调整
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
