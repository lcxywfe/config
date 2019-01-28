" ==============================================================================
" vundle
" ==============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" -----------------------------------------------------------------------------


" ==============================================================================
" ycm
" ==============================================================================
" invoke completion by pressing ctrl+/ (ctrl+/ is recognized as C-_)
"set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
" nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"跳转分屏
let g:ycm_goto_buffer_command = 'horizontal-split'
" invoke omni completion by pressing ctrl+/ (ctrl+/ is recognized as C-_)
inoremap <unique> <C-_> <C-X><C-O><C-P>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" -----------------------------------------------------------------------------

" ==============================================================================
" clang-format
" ==============================================================================
let g:clang_format#command = 'clang-format-5.0'
let g:clang_format#detect_style_file = 1
" -----------------------------------------------------------------------------



syntax on

set autoread

set nobackup

set noswapfile

let g:molokai_original = 1
let g:rehash256 = 1 
set background=dark
set t_Co=256
colorscheme molokai

set hlsearch
set incsearch
set ignorecase
set smartcase

set number

set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

set wildmenu

set cursorcolumn
set cursorline

set scrolloff=7

set cc=81

nnoremap U <C-r>
noremap H ^
noremap L $
map <space> /

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 保存文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

nmap <F2> :NERDTree  <CR>

" 状态栏
set laststatus=2      " 总是显示状态栏
" highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径,将$HOME转化为~
function! CurDir()
        let curdir = substitute(getcwd(), $HOME, "~", "g")
        return curdir
endfunction
" set statusline=%{CurDir()}\/%f%m%r%h\ \%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ USER}\ @\ %{hostname()}\
set statusline=%{CurDir()}\/%f%m%r%h\ \%=\|\ %l,%c\ %p%%\ \%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}

:set pastetoggle=<F4>

