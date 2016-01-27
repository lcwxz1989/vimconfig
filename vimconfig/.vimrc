" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 不使用vi默认键盘布局
set nocompatible
"使用cstags Ctrl+]
set nocst
"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese

"语言设置
set langmenu=zh_CN.UTF-8

" 显示行号
set number  
" 智能对齐
set smartindent 
" 括号匹配模式 
set showmatch
" 显示状态行   
set ruler  

"设置配色方案
colorscheme torte

"可以在buffer的任何地方使用鼠标
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

set incsearch                              
" tab键为4个空格
set tabstop=4
set shiftwidth=4 
set softtabstop=4
" 自动对齐
set autoindent 
if &term=="xterm"
set t_Co=8
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif

" C语言格式对齐
set cindent              
" 不要备份文件
set nobackup             
" 与windows共享剪贴板 
set clipboard+=unnamed   
" make backspace work like most other apps
set backspace=2 

syntax on 
"打开文件类型自动检测功能
filetype on       


" 配置cvim
filetype plugin on

" C的编译和运行
    map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
    endfunc

    " C++的编译和运行
    map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
    endfunc

    " =====================================================
    "		PHP
    " =====================================================
    " The php doc plugin
    " source ~/.vim/php-doc.vim
    inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
    nnoremap <C-P> :call PhpDocSingle()<CR>
    vnoremap <C-P> :call PhpDocRange()<CR>

    " run file with PHP CLI (CTRL-M)
    :autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>

    " PHP parser check (CTRL-L)
    :autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

    " Do use the currently active spell checking for completion though!
    " (I love this feature :-)
    set complete+=kspell

    " disable tabs
    set expandtab
    set shiftwidth=4
    set softtabstop=4

    " highlt matches
    set hlsearch

    " Taken from http://peterodding.com/code/vim/profile/vimrc
    " Make Vim open and close folded text as needed because I can't be bothered to
    " do so myself and wouldn't use text folding at all if it wasn't automatic.
    set foldmethod=marker foldopen=all,insert foldclose=all

    " Enable enhanced command line completion.
    set wildmenu wildmode=list:full

    " Ignore these filenames during enhanced command line completion.
    set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif " binary images
    set wildignore+=*.luac " Lua byte code
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.pyc " Python byte code
    set wildignore+=*.spl " compiled spelling word lists
    set wildignore+=*.sw? " Vim swap files

    " Enable completion dictionaries for PHP buffers.
    autocmd FileType php set complete+=k~/.vim/dict/PHP.dict

    " PHP Autocomplete
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    set ofu=syntaxcomplete#Complete

    " You might also find this useful
    " PHP Generated Code Highlights (HTML & SQL)
    let php_sql_query=1
    let php_htmlInStrings=1
    let g:php_folding=2
    set foldmethod=syntax

    " --------------------
    " Project
    " --------------------
    map <A-S-p> :Project<CR>
    map <A-S-o> :Project<CR>:redraw<CR>/
    "nmap <silent> <F3> <Plug>ToggleProject
    "let g:proj_window_width = 30
    "let g:proj_window_increment = 150

    "nnoremap <silent> <F8> :TlistToggle<CR>
    "let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
    "let Tlist_Show_One_File = 1       " Only show tags for current buffer
    "let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
    "let tlist_sql_settings = 'sql;P:package;t:table'
    "let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'

    " auto change directory from: http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | lcd %:p:h | endif

    " when we reload, tell vim to restore the cursor to the saved position
    augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ let JumpCursorOnEdit_foo = line("'\"") |
    \ let b:doopenfold = 1 |
    \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \ let b:doopenfold = 2 |
    \ endif |
    \ exe JumpCursorOnEdit_foo |
    \ endif |
    \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \ exe "normal zv" |
    \ if(b:doopenfold > 1) |
    \ exe "+".1 |
    \ endif |
    \ unlet b:doopenfold |
    \ endif
    augroup END

    " PHP code sniffer
    " If code sniffer is installed you can run it on current php file by running
    " :Phpcs
function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv --standard=YMC '.l:filename)
    "    echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
    endfunction

    set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Phpcs execute RunPhpcs()


    "-----------------------------------------------------------------
    " plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
    ":ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree
    " o 打开关闭文件或者目录 t 在标签页中打开
    " T 在后台标签页中打开 ! 执行此文件
    " p 到上层目录 P 到根目录
    " K 到第一个节点 J 到最后一个节点
    " u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）
    " r 递归刷新当前目录 R 递归刷新当前根目录
    "-----------------------------------------------------------------
    " F3 NERDTree 切换
    map <F3> :NERDTreeToggle<CR>
    imap <F3> <ESC>:NERDTreeToggle<CR>

    "-----------------------------------------------------------------
    " plugin - NERD_commenter.vim 注释代码用的，
    " [count],cc 光标以下count行逐行添加注释(7,cc)
    " [count],cu 光标以下count行逐行取消注释(7,cu)
    " [count],cm 光标以下count行尝试添加块注释(7,cm)
    " ,cA 在行尾插入 ,并且进入插入模式。 这个命令方便写注释。
    " 注：count参数可选，无则默认为选中行或当前行
    "-----------------------------------------------------------------
    let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
    let NERDCompactSexyComs=1 " 多行注释时样子更好

    "-----------------------------------------------------------------
    "" plugin - taglist.vim 查看函数列表，需要ctags程序
    " F4 打开隐藏taglist窗口
    " "-----------------------------------------------------------------
""nnoremap <silent><F4> :TlistToggle<CR>
""    let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的
""    let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
""    let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口
""    let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表
""    let Tlist_Auto_Open = 0
""    let Tlist_Auto_Update = 1
""    let Tlist_Hightlight_Tag_On_BufEnter = 1
""    let Tlist_Enable_Fold_Column = 0
""    let Tlist_Process_File_Always = 1
""    let Tlist_Display_Prototype = 0
""    let Tlist_Compact_Format = 1

    "-----------------------------------------------------------------
    "" plugin - NeoComplCache.vim 自动补全插件
    "-----------------------------------------------------------------
    let g:AutoComplPop_NotEnableAtStartup = 1
    let g:NeoComplCache_EnableAtStartup = 1
    let g:NeoComplCache_SmartCase = 1
    let g:NeoComplCache_TagsAutoUpdate = 1
    let g:NeoComplCache_EnableInfo = 1
    let g:NeoComplCache_EnableCamelCaseCompletion = 1
    let g:NeoComplCache_MinSyntaxLength = 3
    let g:NeoComplCache_EnableSkipCompletion = 1
    let g:NeoComplCache_SkipInputTime = '0.5'
    let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
    " <TAB> completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    " snippets expand key
    imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

    "set tags+=/Applications/XAMPP/htdocs/diditaxi/coupon/trunk/tags
    set tags+=/Users/lcwxz1989/Workspaces/goproject/src/codis
    set tags+=./tags;


    "-----------------------------------------------------------------
    """ plugin - go 语言补全 
    "-----------------------------------------------------------------
    syntax enable  
    filetype plugin on  
    set number  
    let g:go_disable_autoinstall = 0

    " Highlight
    let g:go_highlight_functions = 1  
    let g:go_highlight_methods = 1  
    let g:go_highlight_structs = 1  
    let g:go_highlight_operators = 1  
    let g:go_highlight_build_constraints = 1  

    "-----------------------------------------------------------------
    """ 自动补全 
    "-----------------------------------------------------------------

    let g:neocomplete#enable_at_startup = 1


    let g:tagbar_type_go = {  
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                    \ },
            \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                    \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
                \ }
nmap <F8> :TagbarToggle<CR>
"godef配置
let g:godef_split=0
let g:godef_split=2
let g:godef_split=3
let g:godef_same_file_in_same_window=1
function! GotoDefinition()
    let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
    endfunction
    map <F5> :call GotoDefinition()<CR>
    imap <F5> <c-o>:call GotoDefinition()<CR>
