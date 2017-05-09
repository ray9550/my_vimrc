set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

filetype off
" Vundle setup
set rtp+=d:\Vim\vimfiles/bundle/Vundle.vim
call vundle#begin('d:\Vim\vimfiles\bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'upsuper/vim-colorschemes'
"Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/taglist.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

call vundle#end()
filetype plugin indent on

let g:SuperTabDefaultCompletionType="context"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:AutoPairFlyMode=1

" Nerdcommenter
let g:NERDSpaceDelims=1
"<leader>cc   加注释
"<leader>cu   解开注释
"<leader>c<space>  加上/解开注释, 智能判断
"<leader>cy   先复制, 再注解(p可以进行黏贴)

"NERDTree快捷键
noremap <F2> :NERDTree  <CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
"""
"o 打开关闭文件或者目录
"t 在标签页中打开
"T 在后台标签页中打开
"! 执行此文件
"p 到上层目录
"P 到根目录
"K 到第一个节点
"J 到最后一个节点
"u 打开上层目录
"m 显示文件系统菜单（添加、删除、移动操作）
"? 帮助
"q 关闭

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#606060 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4

" Set CursorLine & CursorColumn
set cursorline
set cursorcolumn

set shiftwidth=4 softtabstop=4 tabstop=4 expandtab smarttab autoindent

" Set align vertical line
" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/

" split setting
set splitright
set splitbelow
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Setting vim-markdown
let g:vim_markdown_frontmatter=1

set background=dark
colorscheme molokai

set guifont=YaHei_Consolas_Hybrid:h13:cGB2312
set gfw=YaHei_Consolas_Hybrid:h13:cANSI

set nu
set clipboard+=unnamed

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [%{&ff}\ \|\ %Y\ \|\ %l,%v\ %p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" tags
let Tlist_Ctags_Cmd = 'd:\Vim\ctags58\ctags'
set tags=d:\Vim\ctags58\tags

noremap <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'md'
        echo "No map F5 for compile."
    else
        echo "No map F5 for compile."
    endif
endfunc

set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese

set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_cn.utf-8
