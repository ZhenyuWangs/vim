set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" autoindent may cause problems below can fix it 
Plugin 'vim-scripts/indentpython.vim'

Plugin 'tmhedberg/SimpylFold'

" colorscheme 
Plugin 'tomasr/molokai'

" file tree
Plugin 'scrooloose/nerdtree'
"tab
Plugin 'jistr/vim-nerdtree-tabs'
" Taglist`
Plugin 'majutsushi/tagbar'
" Error checking
Plugin 'w0rp/ale'
" powerline 
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Undo Tree
"
"colorscheme of powerline
Plugin 'Lokaltog/vim-powerline'

Plugin 'nathanaelkane/vim-indent-guides'
" distraction free writing mode
Plugin  'junegunn/goyo.vim'

Bundle 'Valloric/YouCompleteMe'

" let syntax on 
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za


let g:SimpylFold_docstring_preview=1


" code indent
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" 定义快捷键的前缀，即<Leader>
let mapleader=" "
 
set scrolloff=20 "control the light sign's position
set relativenumber
set nu
set encoding=utf-8
set showcmd
set wildmenu
set incsearch 
set ignorecase
set smartcase
"set mouse=a
let &t_ut=''

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let python_highlight_all=1
syntax on


set background=dark
colorscheme molokai 
"change the colorscheme style


set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" no band line zhe hang
set nowrap
" always show the powerline
set laststatus=2
"show the position of light sign
set ruler

"highlight the current line
set cursorline
set cursorcolumn

"highlight the search result
set hlsearch 
 hi Normal guibg=NONE ctermbg=NONE     " 设置背景透明
let g:Powerline_colorscheme='solarized256'

set undodir=~/.undo_history/    " 保存 undo 历史
set undofile

autocmd BufWritePost $MYVIMRC source $MYVIMRC   "让配置变更立即生效
set report=0                            " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白，便于阅读

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1


" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T


"< ( [ " ' complete
inoremap( ()<ESC>i
inoremap[ []<ESC>i
inoremap' ''<ESC>i
"inoremap" ""<ESC>i

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
 
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
"
"Tagbar
let g:tagbar_width=30
let g:tagbar_autofocus=1
let g:tagbar_right=1
nmap <F3> : TagbarToggle<CR>
" ----------
"YCM colorscheme
"" ----------
" menu   
highlight Pmenu ctermfg=10 ctermbg=6666 guifg=#005f87 guibg=#EEE8D5
" chosen one for 2 3
highlight PmenuSel ctermfg=44 ctermbg=6 guifg=#AFD700 guibg=#106900
"YCM work also in # content for for 
let g:ycm_complete_in_comments=1
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 补全内容不以分割子窗口形式出现,只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	

" ------
"   ole
" ------ 
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

"
"TNERDTree settings
" " 打开vim自动打开目录树
autocmd vimenter * NERDTree
" " 关闭文件后，如果只剩目录树窗口，则直接关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif
" " F2键开启/关闭目录树
map <F4> :NERDTreeToggle<cr>
" " 将目录树窗口设置在左边
let g:NERDTreeWinPos="left"
" " 设置目录树窗口宽度为30
let g:NERDTreeWinSize=30
" " 显示目录树窗口行号
let g:NERDTreeShowLineNumbers=1


"""""""""""""""""""""n
    "Quickly Run
""""""""""""""""""""""
    map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python2.7 %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
endfunc
