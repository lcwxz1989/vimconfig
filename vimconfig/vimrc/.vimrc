set incsearch                              
" tab键为4个空格
set tabstop=4
set shiftwidth=4 
set softtabstop=4
" 自动对齐
set autoindent 
if &term=="xterm"
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif

"使用cstags Ctrl+]
set nocst
"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese

"语言设置
set langmenu=zh_CN.UTF-8

" 智能对齐
"set smartindent 
" 括号匹配模式 
set showmatch
" 显示状态行   
set ruler  

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 设定颜色集合，必须放在第一行
let g:solarized_termcolors=256
" 配色方案
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
"colorscheme molokai
"colorscheme phd

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

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on


" 不做任何保存，直接退出 vim
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


function! GotoDefinition()
    let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
    endfunction
    map <F5> :call GotoDefinition()<CR>
    imap <F5> <c-o>:call GotoDefinition()<CR>


function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    if exists('t:NERDTreeBufName')
    let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
    let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    if nerdtree_open && tagbar_open
    NERDTreeClose
    TagbarClose
    elseif nerdtree_open
    TagbarOpen
    elseif tagbar_open
    NERDTree
    else
    NERDTree
    TagbarOpen
    endif

    for window in range(1, winnr('$'))
    execute window . 'wincmd w'
    if exists('w:jumpbacktohere')
    unlet w:jumpbacktohere
    break
    endif
    endfor
    endfunction
    nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>


let g:winManagerWindowLayout='NERDTree|Tagbar'
let g:winManagerWidth=30
let g:AutoOpenWinManager = 1 "这里要配合修改winmanager.vim文件，见下方说明"
 
let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
        exe 'q' "执行一个退出命令，关闭自动出现的窗口"
            exe 'NERDTree'
            endfunction
             
            function! NERDTree_IsValid()
        return 1
        endfunction
         
        noremap <f5> :NERDTreeFind<cr>
         
        let g:Tagbar_title = "[Tagbar]"
        function! Tagbar_Start()
        exe 'q' "执行一个退出命令，关闭自动出现的窗口"
            exe 'TagbarOpen'
            endfunction
             
            function! Tagbar_IsValid()
        return 1
        endfunction
        let g:tagbar_vertical = 30


"set runtimepath^=/Users/lcwxz1989/.vim/bundle/vim-erlang-tags
