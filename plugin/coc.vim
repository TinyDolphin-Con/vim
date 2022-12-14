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
#        Last Modified: 2022/12/14 13:45:41
#
#  Sections:
#     -> neoclide/coc.nvi
#
# #############################################################

# #############################################################
# => neoclide/coc.nvi 语法智能补全插件
# #############################################################

# 指定 coc 配置文件路径目录
g:coc_config_home = "~/.vim_runtime"

# coc 插件列表
g:coc_global_extensions = [
  'coc-clangd',
  'coc-jedi',
  'coc-snippets',
  'coc-markdownlint',
  'coc-git',
  'coc-cmake',
  'coc-tabnine',
  'coc-json',
  'coc-pyright',
  'coc-pairs',
  'coc-vimlsp',
  'coc-highlight',
  'coc-sh',
  'coc-yaml',
  'coc-syntax',
  'coc-ci',
  'coc-smartf',
  'coc-word',
  'coc-diagnostic',
  'coc-xml',
  'coc-translator',
  'coc-vimtex',
  'coc-texlab',
  'coc-prettier',
  'coc-explorer',
]

# 方便在中文中间使用 w 和 b 移动（略有点卡，不用）
# nmap <silent> w <Plug>(coc-ci-w)
# nmap <silent> b <Plug>(coc-ci-b)

# 300ms 内没有输入任何东西，交换文件将被写入磁盘
set updatetime=300

# 使用 <tab> 移动到下一个提示、<Shift> + <Tab> 移动到上一个提示
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

# 使用 <CR> 选择当前提示
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

# help function
def CheckBackspace(): bool
  var col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
enddef

# 插入模式按键触发补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

# 使用 [g ]g 移动到上一个或下一个诊断
# :CocDiagnostics 可显示当前缓冲区的所有诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

# goto 代码导航（定义、类型、实现、引用等）
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gtd <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

# 存在问题
# 显示文档
nnoremap <silent> gK :call ShowDocumentation()<CR>

# help function
function g:ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

# 在 updatetime 时间内没有按键，高亮显示
# autocmd CursorHold * silent call CocActionAsync('highlight')

# 触发重命名
nmap <leader>crn <Plug>(coc-rename)
# 重构方法
nmap <leader>crf <Plug>(coc-refactor)

# 格式化选中代码
xmap <leader>cfs  <Plug>(coc-format-selected)
nmap <leader>cfs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  # Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  # Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

# 对选中对代码进行操作
#xmap <leader>a  <Plug>(coc-codeaction-selected)
#nmap <leader>a  <Plug>(coc-codeaction-selected)

# 快速修复代码
# nmap <leader>ac  <Plug>(coc-codeaction)
# nmap <leader>qf  <Plug>(coc-fix-current)
# nmap <leader>cl  <Plug>(coc-codelens-action)

# 快速选中整个函数或者类
# 快速选中整个函数（不包括函数名尾）
xmap cfi <Plug>(coc-funcobj-i)
omap cfi <Plug>(coc-funcobj-i)
# 快速选中整个函数（包括函数名）
xmap cfa <Plug>(coc-funcobj-a)
omap cfa <Plug>(coc-funcobj-a)
# 快速选中整个类（不包括类名）
xmap cci <Plug>(coc-classobj-i)
omap cci <Plug>(coc-classobj-i)
# 快速选中整个类（包括类名头尾）
xmap cca <Plug>(coc-classobj-a)
omap cca <Plug>(coc-classobj-a)

# 滚动浮动窗口或弹出窗口：<C-f>、<C-b>
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

# 利用 C-s 来选择范围
# Requires 'textDocument/selectionRange' support of language server.
# nmap <silent> <C-s> <Plug>(coc-range-select)
# xmap <silent> <C-s> <Plug>(coc-range-select)

# 利用 :Format 来格式化当前 buffer
command! -nargs=0 Format :call CocActionAsync('format')

# 利用 :Fold 来折叠当前 buffer
# command! -nargs=? Fold :call CocAction('fold', <f-args>)

# Add `:OR` command for organize imports of the current buffer.
# command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

# 状态栏支持
# set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

# 显示所有诊断信息
nnoremap <silent><nowait> <leader>Cd  :<C-u>CocList diagnostics<cr>
# 管理插件
nnoremap <silent><nowait> <leader>Ce  :<C-u>CocList extensions<cr>
# 显示命令行
nnoremap <silent><nowait> <leader>Cc  :<C-u>CocList commands<cr>
# 显示当前文档的 symbols
nnoremap <silent><nowait> <leader>Co  :<C-u>CocList outline<cr>
# 显示workspace symbols （可查看源码实现）
nnoremap <silent><nowait> <leader>Cs  :<C-u>CocList -I symbols<cr>
# 对下一个做默认操作
# nnoremap <silent><nowait> <leader>Cn  :<C-u>CocNext<CR>
# 对上一个做默认操作
# nnoremap <silent><nowait> <leader>Cp  :<C-u>CocPrev<CR>
# 恢复最新的 coc list
nnoremap <silent><nowait> <leader>Cr  :<C-u>CocListResume<CR>
