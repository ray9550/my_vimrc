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
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplete.vim'

" Brief help  -- ´Ë´¦ºóÃæ¶¼ÊÇvundleµÄÊ¹ÓÃÃüÁî
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

<<<<<<< HEAD
"NERDTree¿ì½İ¼ü
=======
" Nerdcommenter
let g:NERDSpaceDelims=1
"<leader>cc   åŠ æ³¨é‡Š
"<leader>cu   è§£å¼€æ³¨é‡Š
"<leader>c<space>  åŠ ä¸Š/è§£å¼€æ³¨é‡Š, æ™ºèƒ½åˆ¤æ–­
"<leader>cy   å…ˆå¤åˆ¶, å†æ³¨è§£(på¯ä»¥è¿›è¡Œé»è´´)

"NERDTreeå¿«æ·é”®
>>>>>>> ed54a5fd22c90c14f1ee1e2973e306a15ff6434f
noremap <F2> :NERDTree  <CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
"""
"o ´ò¿ª¹Ø±ÕÎÄ¼ş»òÕßÄ¿Â¼
"t ÔÚ±êÇ©Ò³ÖĞ´ò¿ª
"T ÔÚºóÌ¨±êÇ©Ò³ÖĞ´ò¿ª
"! Ö´ĞĞ´ËÎÄ¼ş
"p µ½ÉÏ²ãÄ¿Â¼
"P µ½¸ùÄ¿Â¼
"K µ½µÚÒ»¸ö½Úµã
"J µ½×îºóÒ»¸ö½Úµã
"u ´ò¿ªÉÏ²ãÄ¿Â¼
"m ÏÔÊ¾ÎÄ¼şÏµÍ³²Ëµ¥£¨Ìí¼Ó¡¢É¾³ı¡¢ÒÆ¶¯²Ù×÷£©
"? °ïÖú
"q ¹Ø±Õ

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
" ÏÔÊ¾tabºÍ¿Õ¸ñ
set list
" ÉèÖÃtabºÍ¿Õ¸ñÑùÊ½
set lcs=tab:\|\ ,nbsp:%,trail:-
" Éè¶¨ĞĞÊ×tabÎª»ÒÉ«
highlight LeaderTab guifg=#666666
" Æ¥ÅäĞĞÊ×tab
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
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Setting neocomplete.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

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

set background=dark
colorscheme molokai

set guifont=YaHei_Consolas_Hybrid:h13:cGB2312
set gfw=YaHei_Consolas_Hybrid:h13:cANSI

set nu
set clipboard+=unnamed

" ÎÒµÄ×´Ì¬ĞĞÏÔÊ¾µÄÄÚÈİ£¨°üÀ¨ÎÄ¼şÀàĞÍºÍ½âÂë£©
set statusline=%F%m%r%h%w\ [%{&ff}\ \|\ %Y\ \|\ %l,%v\ %p%%]
" ×ÜÊÇÏÔÊ¾×´Ì¬ĞĞ
set laststatus=2
" ÃüÁîĞĞ£¨ÔÚ×´Ì¬ĞĞÏÂ£©µÄ¸ß¶È£¬Ä¬ÈÏÎª1£¬ÕâÀïÊÇ2
set cmdheight=2

" tags
let Tlist_Ctags_Cmd = 'd:\Vim\ctags58\ctags'
set tags=d:\Vim\ctags58\tags

noremap <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'html'
        exec "! firefox %"
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
