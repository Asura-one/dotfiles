"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Auto load for first time uses                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source '~/.config/nvim/init.vim'
endif

" read through his file and change what you need to change

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" Language Server
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['/usr/bin/pyls'],
"     \ }

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

exec 'set rtp+='.s:home

set rtp+=~/.config/.nvim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           模块加载                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
LoadScript config/general.vim
LoadScript config/plugin.vim
LoadScript config/keymap.vim
