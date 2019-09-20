" my plugin
for s:path in split(glob('~/.vim/plugins/*.vim'), "\n")
  exe 'source ' . s:path
endfor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           插件列表                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cocopon/iceberg.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mbbill/undotree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'z0mbix/vim-shfmt' , { 'for': 'sh' }
Plug 'ervandew/supertab'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'voldikss/vim-translate-me'
Plug 'dhruvasagar/vim-table-mode'
Plug 'lervag/vimtex'
Plug 'vim-latex/vim-latex'
" color
Plug 'arcticicestudio/nord-vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Coc.nvim                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
let g:node_client_debug = 1
"let g:coc_global_extensions = ['coc-ultisnips']
" let g:coc_watch_extensions = ['coc-snippets']
"let g:coc_trace_client = 1
let g:coc_node_path = '/usr/bin/node'
"let g:coc_node_args = ['--nolazy', '--inspect=6045']
let g:coc_auto_copen = 0
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           NERDTree 文件浏览                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup nerd_behaviours
  au!
  autocmd StdinReadPre * let s:std_in = 1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() && b:NERDTreeType == "primary") | q | endif
  autocmd tableave * if exists('g:loaded_nerd_tree') | execute 'NERDTreeClose' | endif
augroup END

let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp', '__pycache__[[dir]]']
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_console_startup=0
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeNaturalSort = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeShowHidden = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Quickly Run                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd  QuickFixCmdPost  *  botright  copen  8
let g:asyncrun_encs = 'utf-8'
let g:vimmake_build_encoding = 'utf-8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           IndentLine                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char='|'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'

function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Vim-devicons 文件图标                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
" let g:webdevicons_enables_airline_tabline=1
" let g:webdevicons_enable_airline_statusline=1
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:DevIconsEnableFoldersOpenClose=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           ALE 代码检查                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示侧边栏
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 0
let g:ale_linters_explicit = 1
"改变状态栏信息格式
"改变命令行消息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
			\ 'bash':['shellcheck'],
			\ 'ansible':['ansible-lint'],
			\ 'dockerfile':['hadolint'],
			\ 'markdown':['alex'],
			\ 'python':['flake8'],
			\ 'vim':['vint'],
			\ 'yaml':['yamllint'],
			\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_fixers = {
    \ 'python': ['autopep8', 'yapf'],
    \ 'bash': ['shfmt'],
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vimwiki                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_menu = '' " 不在菜单栏显示Vimwiki
let g:vimwiki_diary_months = {
    \ 1: '一月', 2: '二月', 3: '三月', 4: '四月', 5: '五月', 6: '六月',
    \ 7: '七月', 8: '八月', 9: '九月', 10: '十月', 11: '十一月', 12: '十二月'
    \ }
let g:vimwiki_use_mouse = 1
let g:vimwiki_camel_case = 0
let g:vimwiki_CJK_length = 1
let g:vimwiki_use_calendar = 0
let g:vimwiki_global_ext = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_timestamp_format='%Y年%m月%d日 %H:%M:%S'
let g:vimwiki_user_htmls = "search.html,404.html"

let g:vimwiki_list = [{'develop_notes': '~/develop_notes'},
  \ {'path': '~/Job_Work/work',
    \ 'path_html': '~/Job_Work/work/html',
    \ 'template_path': '~/.vim/plugged/vimwiki/autoload/vimwiki/default.tpl',
    \ 'syntax': 'markdown',
    \ 'ext': '.wiki',
    \ 'template_default': 'markdown',
    \ 'custom_wiki2html': '~/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh',
    \ 'template_ext': '.html',
    \ 'automatic_nested_syntaxes': 1}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

"au BufRead,BufNewFile *.md set filetype=vimwiki

let g:taskwiki_sort_orders={"C": "pri-"}
let g:taskwiki_syntax = 'markdown'
let g:taskwiki_markdown_syntax='markdown'
let g:taskwiki_markup_syntax='markdown'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           undotree                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           UltiSnips 代码片段补全                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsSnippetsDir = '~/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsEditSplit='vertical'
" 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
au FileType *.md, *.markdown :UltiSnipsAddFiletypes markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           MarkdownPreview                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_browser = ""
let g:mkdp_auto_start = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           LeaderF                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_ReverseOrder = 1

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\ }

let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_MruMaxFiles = 2048
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:LF_DefaultExternalTool = 'ag'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           SuperTab                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = '<C-n>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-translate-me                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vtm_default_engine='google'
hi def link vtmQuery             Identifier
hi def link vtmParaphrase        Statement
hi def link vtmPhonetic          Special
hi def link vtmExplain           Comment
hi def link vtmPopupNormal       NormalFloat


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Coc snippets                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'
" let g:UltiSnipsSnippetDirectories = '~/.config/nvim/mysnippets'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Vim Table Mode                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vim/plugged/vim-table-mode/autoload/tablemode.vim"))
    let g:table_mode_auto_align = 0

    autocmd FileType markdown
                \ let g:table_mode_corner = "|" |
                \ let g:table_mode_corner_corner = "|" |
                \ let g:table_mode_header_fillchar = "-" |
                \ let g:table_mode_align_char = ":"
    autocmd FileType rst
                \ let g:table_mode_corner = "+" |
                \ let g:table_mode_corner_corner = "+" |
                \ let g:table_mode_header_fillchar = "="
    autocmd FileType org
                \ let g:table_mode_corner = "+" |
                \ let g:table_mode_corner_corner = "|" |
                \ let g:table_mode_header_fillchar = "-"
endif
autocmd FileType markdown,rst,org :silent TableModeEnable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Vimtex                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_manual=1
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-xelatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
set conceallevel=1
let g:tex_conceal='abdmg'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           主题设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:onedark_termcolors=256
let g:onedark_color_overrides = {"black": {"gui": "#1F2D3A", "cterm": "NONE", "cterm16": "0"}}
hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE " 设置行高亮颜色
hi Search cterm=NONE ctermfg=NONE ctermbg=8 " 设置搜索高亮颜色
hi Visual cterm=NONE ctermfg=NONE ctermbg=0 " 设置Visual 模式高亮颜色
hi BadWhitespace ctermbg=red guibg=red " 使用红色显示多余空格
