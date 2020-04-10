set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')  "插件安装要在这个之后，写完后在vim中使用PluginInstall来自动下载安装

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"*********************************插件安装*************************************"
" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'   "VundleVim插件管理
"Plugin 'itchyny/lightline.vim'  "状态栏1
Plugin 'preservim/nerdtree'     "文件树
Plugin 'frazrepo/vim-rainbow'   "括号匹配色
Plugin 'vim-airline/vim-airline'   "状态栏插件2
Plugin 'Shougo/neocomplete.vim'  "语法自动补全；按TAB键进行确认
Plugin 'Raimondi/delimitMate'  "括号自动补全插件
"Plugin 'w0rp/ale'  "语法检查
"Plugin 'Valloric/YouCompleteMe'  "最难安装的补全插件
"Plugin 'phonzia/cppSyntaxCheck'
"Plugin 'nathanaelkane/vim-indent-guides'  "对齐线
"Plugin 'Yggdroot/indentLine'  "对齐线2
Plugin 'majutsushi/tagbar' "tagbar类似于tarlist

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
"Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前                                                                                   
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置自己的leader
let mapleader=","
" 打开文件类型侦测
filetype on
" 根据不同的文件类型加载不同的插件
filetype plugin on
" 定义快捷键到行尾部和首部
nmap H ^
nmap L $
" 快速跳转
nmap J 3j
nmap K 3k
" 关于保存退出文件相关
nmap <Leader>w :w<CR>
nmap <Leader>e :wq<CR>

" 处理复制粘贴
vnoremap <Leader>y "+y
nmap <Leader>p "+p
" 跳转Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 让vim配置保存后立马生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 开启实时搜索并且对大小写不敏感
set incsearch
set ignorecase
" 关闭兼容模式
set nocompatible
" 设置忽略大小写
set ignorecase
" 开启vim自身命令行模式智能补全
set wildmenu
" 消除颜色
noremap <Leader><space> :nohlsearch<CR>
" 设置颜色配色
" colorscheme one
set background=dark
" 自动识别文件格式
set fileformats=unix,dos
set fileformat=unix
" 统一缩紧
set tabstop=4         "设置 tab 的宽度
set softtabstop=4     "设置 删除 tab 的宽度
set shiftwidth=4      "设置 智能缩进的宽度
set expandtab         "设置 将 tab 转换为 4 个空格
%retab!
" 不能自动换行
set nowrap
" 格式化
set formatoptions=tcrqn " 根据要求格式化
set autoindent     " 继承缩紧
set smartindent    " 为C语言提供自动缩紧
set cindent        " 使用C样式缩紧
set smarttab       " 在行和段开始处使用制表符
" 设置文件编码
set fileencoding=utf-8
" 搜索设置
set showmatch      " 匹配成队符号
set matchtime=5    " 匹配括号高亮的时间
" 行数控制
set scrolloff=20  " 光标始终保持在距离上下顶点20行的位置
set number "显示行号
"set ai "或者 set autoindent vim使用自动对齐，也就是把当前行的对齐格式应用到下一行
set si "或者 set smartindent 依据上面的对齐格式，智能的选择对齐方式
"set ci "set cindent 按照 C 语言的语法，自动地调整缩进的长度
syntax on "高亮语法
set mouse=a  "鼠标支持

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tagbar
let g:tagbar_width=25
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F4> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:indent_guides_enable_on_vim_startup = 1  "对齐线vim-indent-guides开启
"let g:indent_guides_enable_on_vim_startup = 1 "添加行，vim启动时启用
"let g:indent_guides_start_level = 1           "添加行，开始显示对齐线的缩进级别
"let g:indent_guides_guide_size = 1            "添加行，对齐线的宽度，（1字符）
"let g:indent_guides_tab_guides = 1            "添加行，对tab对齐的禁用

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist
"set mouse=a                            "这个设置是必须的，这样才能点击标签
let Tlist_Ctags_Cmd = 'ctags'           "设置ctags命令的路径
let Tlist_Show_One_File = 1             "不同时显示多个文件的tag
let Tlist_Exit_OnlyWindow = 1           "如果taglist是当前最后一个窗口则退出vim
let Tlist_Use_Right_Window = 0          "设置窗口位置为右边（默认在左>边）
let Tlist_Sort_Type='name'              "设置Tlist的排序方式为按名称排序，默认为按出现顺序
let Tlist_Use_SingleClick=1             "设置单击一次tag即跳转到定义，默认为双击
"let Tlist_Auto_Open = 1                "设置开启vim自动打开Tlist
"let Tlist_Close_On_Select = 1          "设置在选择tag后自动关闭Tlist}
let Tlist_Process_File_Always=1         "在不显示Tlist的时候仍然解析tags
nnoremap <silent> <F8> :TlistToggle<CR> "映射F8为打开和关闭Tlist的快捷键(在normal模式下)
let Tlist_WinWidth = 25                 "设置窗口宽度
"let Tlist_WinHeight =                   "设置窗口高度
"let Tlist_Use_Horiz_Window             "设置窗口横向显示

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1 "开启彩色括号
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"自动补全语法配置
let g:neocomplete#enable_at_startup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"以上为语法补全配置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"语法检查配置
"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'             " 'E'
let g:ale_echo_msg_warning_str = '⚡'               " 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\}
"以上为语法检查配置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"括号自动匹配
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap < <><LEFT>
"function! AutoPair(open, close)
"        let line = getline('.')
"        if col('.') > strlen(line) || line[col('.') - 1] == ' '
"                return a:open.a:close."\<ESC>i"
"        else
"                return a:open
"        endif
"endf

"function! ClosePair(char)
"        if getline('.')[col('.') - 1] == a:char
"                return "\<Right>"
"        else
"                return a:char
"        endif
"endf

"function! SamePair(char)
"        let line = getline('.')
"        if col('.') > strlen(line) || line[col('.') - 1] == ' '
"                return a:char.a:char."\<ESC>i"
"        elseif line[col('.') - 1] == a:char
"                return "\<Right>"
"        else
"                return a:char
"        endif
"endf
"
"inoremap ( <c-r>=AutoPair('(', ')')<CR>
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { <c-r>=AutoPair('{', '}')<CR>
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap [ <c-r>=AutoPair('[', ']')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap " <c-r>=SamePair('"')<CR>
"inoremap ' <c-r>=SamePair("'")<CR>
"inoremap ` <c-r>=SamePair('`')<CR>

""""""""""""""""以上均为括号补全"""""""""""""""""""""""""""""""'

" 自定义状态行
"set laststatus=2
"set statusline=%F\ \ \ Ascii:%b\ 0x:%B\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%p%%]\ 行:%l\ 列:%v\ 最大行:%L\ %y
" 自定义函数
"function! ShowPos()
"	let &statusline = ""
"	let now_line = line(".")
"	let max_line =  line("$")
"	let pos = now_line * 1.0 / max_line * 1.0 * 100
"	let pos = float2nr(pos) / 10
"	let statusline="%F\ \ \ Ascii:%-5b\ 0x:%-4B\ "
"	let statusline2="%=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%p%%]\ 行:%l\ 列:%v\ 最大行:%L\ %y"
"	let statusline3 = "["
"	let g:count = 0
"	while g:count < 10
"		if pos > -1
"			let statusline3 = statusline3 . "➡"
"			let pos = pos - 1
"		else
"			let statusline3 = statusline3 . "\ "
"		endif
"		let g:count = g:count + 1
"	endwhile
"	let statusline3 = statusline3 . "]"
"	let statusline = statusline . statusline3 . statusline2
"	let &statusline = statusline
"endfunction()
"autocmd CursorMoved * call ShowPos()
"autocmd CursorMovedI * call ShowPos()

"inoremap jj <Esc>j
"inoremap kk <Esc>k
"以上都是自定义的状态栏

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree快捷键映射和配置
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 20 "设定 NERDTree 视窗大小
"开启/关闭nerdtree快捷键
map <C-f> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"以上为文件树的配置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim-aline配置
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
"set termencoding = cp936  
" 设置中文提示
language messages zh_CN.utf-8 
" 设置中文帮助
set helplang=cn
" 设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
" 总是显示状态栏 
let laststatus = 2
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
let g:airline_theme="dark"      " 设置主题
" 开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1      
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 设置字体 
set guifont=menlo:h14:cANSI
"以上均为vim-airline配置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置vim-easy-align
" 自动对齐 map visual映射
xnoremap ea :EasyAlign<CR>

" 设置vim-autoformat
" 自动格式化内容
noremap <Leader>ac :Autoformat<CR>
" 设置vim-colorschemes
" 配色方案设置
colorscheme molokai
let g:molokai_original = 1
" 设置youcompleteme
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" 设置octol/vim-cpp-enhanced-highlight
" 默认不高亮类作用域
let g:cpp_class_scope_highlight = 1
" 成员变量也是默认不显示
let g:cpp_member_variable_highlight = 1
" 声明中高亮类名
let g:cpp_class_decl_highlight = 1
" 模版突出显示
let g:cpp_experimental_template_highlight = 1
" 库突出显示
let g:cpp_concepts_highlight = 1

" 设置ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

" 高亮显示当前行和列
set cursorline
set cursorcolumn

set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 解决ycm和ultisnips的tab问题
"function! g:UltiSnips_Complete()
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res == 0
"    if pumvisible()
"      return "\<C-n>"
"    else
"      call UltiSnips#JumpForwards()
"      if g:ulti_jump_forwards_res == 0
"        return "\<TAB>"
"      endif
"    endif
"  endif
"  return ""
"endfunction

"function! g:UltiSnips_Reverse()
"  call UltiSnips#JumpBackwards()
"  if g:ulti_jump_backwards_res == 0
"    return "\<C-P>"
"  endif

"  return ""
"endfunction


"if !exists("g:UltiSnipsJumpForwardTrigger")
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif
"if !exists("g:UltiSnipsJumpBackwardTrigger")
"  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif

"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""