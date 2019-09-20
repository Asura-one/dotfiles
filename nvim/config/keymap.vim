" Key (Re)Mappings

let mapleader = ' '   " 定义<leader>键

nnoremap <silent> <c-w>z :ZoomToggle<CR>   " 全屏

cabbrev w!! w !sudo tee %     " write with sudo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Coc.nvim                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           NERDTree                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           ALE                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <buffer> <F7> :ALEFix<CR>

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>d 查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>


" git blame
nmap <Leader>c :<C-u>call gitblame#echo()<CR>

" 进入对应filetype的snippets进行编辑
map <leader>us :UltiSnipsEdit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键位映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <cr> :noh<CR><CR>:<backspace> " 取消搜索高亮
set pastetoggle=<F3> " 如果你复制代码时，它将使代码保持原始缩进
map <leader>r :e<CR> " 刷新文件

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           MarkdownPreview                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>mp :MarkdownPreview<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           LeaderF                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <c-n> :Leaderf mru --regex<cr>
noremap <F4> :LeaderfFunction!<cr>
noremap <F4> :LeaderfBufTag!<cr>

"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg --stayOpen --recall %s ", expand("<cword>"))<CR>

nmap <C-f> :Ag! <cword> %<Left><CR>
nmap <leader>f :Ag! <cword><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-translate-me                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
