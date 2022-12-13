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
#     -> Shougo/defx.nvim
#
# #############################################################

# #############################################################
# => Shougo/defx.nvim defx 文件树插件（支持异步）
# #############################################################

# Define mappings
# 恢复现有的 defx 文件树缓冲区
nnoremap <silent><leader>df :<C-u>Defx -listed -resume -split=vertical
      \ -buffer-name=tab`tabpagenr()` .. `expand('%:p:h')`
      \ -search=`expand('%:p')`<CR>
# 创建新的 defx
nnoremap <silent><leader>dn :<C-u>Defx
      \ -new -split=tab `expand('%:p:h')`
      \ -search=`expand('%:p')`<CR>

# 设置文件名栏的宽度
g:defx#custom#column('filename', {
    'min_width': 10,
    'max_width': 20,
  })

# 图标设置
g:defx#custom#column('icon', {
  'directory_icon': '▸',
  'opened_icon': '▾',
  'root_icon': ' ',
  })

# git 相关图标设置
g:defx#custom#column('git', 'indicators', {
  'Modified': 'M',
  'Staged': '✚',
  'Untracked': '✭',
  'Renamed': '➜',
  'Unmerged': '═',
  'Ignored': '☒',
  'Deleted': '✖',
  'Unknown': '?'
  })

# defx 样式设置
g:defx#custom#option('_', {
  'columns': 'indent:mark:icon:icons:filename:git:size',
  'winwidth': 35,
  # 'split': 'tab',
  # 'direction': 'botright',
  'show_ignored_files': 0,
  'root_marker': '= ',
  'resume': 1
  })

# 如果 defx 是唯一剩下的窗口，则退出 vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:defx') | quit | endif

# 在打开多个tab的情况下，当前tab里只有一个buffer和nerd树，当关闭buffer时，自动关闭当前标签页的nerd树
autocmd BufEnter * if tabpagenr('$') > 1 && winnr('$') == 1 && exists('b:defx') | tabclose | endif

# 进入Vim 或创建新标签页时，打开 defx 文件树缓冲区
autocmd VimEnter,TabNew * Defx -listed -resume -split=vertical -no-focus
      \ -buffer-name=tab`tabpagenr()` .. `expand('%:p:h')`
      \ -search=`expand('%:p')`<CR>

# 改变文件时，自动更新 defx
autocmd BufWritePost * defx#redraw()

# t9md/vim-choosewin 开启配置
g:choosewin_overlay_enable = 1

# NB：建议使用 drop，使其在正确的窗口打开，而非 defx 窗口
autocmd FileType defx Defx_my_settings()
def Defx_my_settings()
  # Define mappings
  nnoremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') :
        \ defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> dd
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> pp
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') :
        \ defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> <Right>
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') :
        \ defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> s
        \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('drop', 'vsplit')
        nnoremap <silent><buffer><expr> P
        \ defx#do_action('search', fnamemodify(defx#get_candidate().action__path, ':h'))
        nnoremap <silent><buffer><expr> p
              \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> i
        \ defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> dD
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('remove')
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> YY
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> <Left>
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> vv
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> >
        \ defx#do_action('resize', defx#get_context().winwidth - 10)
  nnoremap <silent><buffer><expr> <
        \ defx#do_action('resize', defx#get_context().winwidth + 10)
enddef

