LoadScript config/plugin.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           通用设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible      " 设置不兼容原始vi模式
filetype on           " 设置开启文件类型侦测
filetype plugin on    " 设置加载对应文件类型的插件
set noeb              " 关闭错误的提示
syntax enable         " 开启语法高亮功能
syntax on             " 自动语法高亮
set t_Co=256          " 开启256色支持
set showcmd           " select模式下显示选中的行数
set ruler             " 总是显示光标位置
set laststatus=2      " 总是显示状态栏
set number            " 开启行号显示
set cursorline        " 高亮显示当前行
set ttimeout
set ttimeoutlen=50     " 设置<ESC>键响应时间
" set virtualedit=all                " 允许光标出现在最后一个字符的后面
set autochdir         " 打开文件时，自动 cd 到文件所在目录
set noshowmode        " 不显示左下角状态栏
set clipboard+=unnamedplus " system clipboard
let autosave=0        " autosave
set showmatch         " 高亮标识匹配的括号
set scrolloff=5       " 光标距离窗口上下保留5行
" set spell spelllang=en_us          " 开启内置拼写检查
set undofile          " 历史记录

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python pep8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

autocmd BufNewFile,BufRead *.md,*.markdown,*.mmd  nested setlocal filetype=markdown



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           代码缩进和排版                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                 "  设置自动缩进
set cindent                    "  设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    "  设置C/C++语言的具体缩进方式
set smartindent                "  智能的选择对其方式
filetype indent on             "  自适应不同语言的智能缩进
filetype plugin indent on      "  enables filetype detection
set expandtab                  "  将制表符扩展为空格
set tabstop=4                  "  设置编辑时制表符占用空格数
set shiftwidth=4               "  设置格式化时制表符占用空格数
set softtabstop=4              "  设置4个空格为制表符
set smarttab                   "  在行和段开始处使用制表符
set nowrap                     "  禁止折行
set backspace=indent,eol,start "  使用回车键正常处理indent,eol,start等
set sidescroll=10              "  设置向右滚动字符数
set nofoldenable               "  禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           代码补全                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                         "  vim自身命名行模式智能补全
set wildmode=full
set completeopt=menu,menuone "  补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           搜索设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch   "  高亮显示搜索结果
set incsearch  "  开启实时搜索功能
set ignorecase "  搜索时大小写不敏感
set smartcase  "  搜索时，智能大小写

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           缓存设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           编码设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
lang messages zh_CN.UTF-8
language messages zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           主题设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set term=xterm-256color
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors
color onedark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         不同类型文件的缩进                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_formats
  au!

  au FileType help setlocal nu

  au BufNewFile,BufRead *.{vim,vimrc}
        \ setlocal foldmethod=marker |
        \ setlocal tabstop=2         |
        \ setlocal softtabstop=2     |
        \ setlocal shiftwidth=2

  au BufNewFile,BufRead *.py
       \ setlocal autoindent      |
       \ setlocal nowrap          |
       \ setlocal sidescroll=5    |
       \ let g:python_highlight_all = 1 |
       \ setlocal complete+=t |
       \ setlocal formatoptions-=t |
       \ setlocal commentstring=#%s |
       \ setlocal define=^\s*\\(def\\\\|class\\)
       \ set textwidth=79 |

  au BufNewFile,BufRead *.js,*.html,*.css,*.yml
      \ setlocal tabstop=2     |
      \ setlocal softtabstop=2 |
      \ setlocal shiftwidth=2

  " useless whitespaces
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.{vim,vimrc}
      \ highlight BadWhitespace ctermbg=red guibg=darkred |
      \ match BadWhitespace /\s\+$/

augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           其他设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set matchtime=2
set lazyredraw
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set tags=./.tags:,.tags
set formatoptions+=m
set formatoptions+=B
set ffs=unix,dos,mac
" 打开时光标放在上次退出时的位置
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Is better way to zoom windows in Vim than ZoomWin?
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
"nnoremap <silent> <Leader>z :ZoomToggle<CR>

"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  文件搜索和补全时忽略下面扩展名                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

"----------------------------------------------------------------------
" 功能键终端码矫正
"----------------------------------------------------------------------
" call s:key_escape('<F1>', 'OP')
" call s:key_escape('<F2>', 'OQ')
" call s:key_escape('<F3>', 'OR')
" call s:key_escape('<F4>', 'OS')
" call s:key_escape('<S-F1>', '[1;2P')
" call s:key_escape('<S-F2>', '[1;2Q')
" call s:key_escape('<S-F3>', '[1;2R')
" call s:key_escape('<S-F4>', '[1;2S')
" call s:key_escape('<S-F5>', '[15;2~')
" call s:key_escape('<S-F6>', '[17;2~')
" call s:key_escape('<S-F7>', '[18;2~')
" call s:key_escape('<S-F8>', '[19;2~')
" call s:key_escape('<S-F9>', '[20;2~')
" call s:key_escape('<S-F10>', '[21;2~')
" call s:key_escape('<S-F11>', '[23;2~')
" call s:key_escape('<S-F12>', '[24;2~')
