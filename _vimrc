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

set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=utf-8,chinese

set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_cn.utf-8

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
<<<<<<< HEAD
" Plugin 'ervandew/supertab'
=======
"Plugin 'ervandew/supertab'
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
Plugin 'tpope/vim-fireplace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/taglist.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
<<<<<<< HEAD
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
=======
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplete.vim'
<<<<<<< HEAD
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" Brief help  -- ´Ë´¦ºóÃæ¶¼ÊÇvundleµÄÊ¹ÓÃÃüÁî
=======

" Brief help  -- æ­¤å¤„åŽé¢éƒ½æ˜¯vundleçš„ä½¿ç”¨å‘½ä»¤
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
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
" NERD Commenter¿ì½Ý¼ü
=======
" NERD Commenterå¿«æ·é”®
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"[count]<leader>cc |NERDComComment|
"Comment out the current line or text selected in visual mode.

"[count]<leader>cn |NERDComNestedComment|
"Same as cc but forces nesting.

"[count]<leader>c<space> |NERDComToggleComment|
"Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

"[count]<leader>cm |NERDComMinimalComment|
"Comments the given lines using only one set of multipart delimiters.

"[count]<leader>ci |NERDComInvertComment|
"Toggles the comment state of the selected line(s) individually.

"[count]<leader>cs |NERDComSexyComment|
"Comments out the selected lines with a pretty block formatted layout.

"[count]<leader>cy |NERDComYankComment|
"Same as cc except that the commented line(s) are yanked first.

"<leader>c$ |NERDComEOLComment|
"Comments the current line from the cursor to the end of line.

"<leader>cA |NERDComAppendComment|
"Adds comment delimiters to the end of line and goes into insert mode between them.

"|NERDComInsertComment|
"Adds comment delimiters at the current cursor position and inserts between. Disabled by default.

"<leader>ca |NERDComAltDelim|
"Switches to the alternative set of delimiters.

"[count]<leader>cl
"[count]<leader>cb |NERDComAlignedComment|
"Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).

"[count]<leader>cu |NERDComUncommentLine|
"Uncomments the selected line(s).

<<<<<<< HEAD
" NERDTree¿ì½Ý¼ü
=======
" NERDTreeå¿«æ·é”®
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
noremap <F2> :NERDTree  <CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
"""
<<<<<<< HEAD
"o ´ò¿ª¹Ø±ÕÎÄ¼þ»òÕßÄ¿Â¼
"t ÔÚ±êÇ©Ò³ÖÐ´ò¿ª
"T ÔÚºóÌ¨±êÇ©Ò³ÖÐ´ò¿ª
"! Ö´ÐÐ´ËÎÄ¼þ
"p µ½ÉÏ²ãÄ¿Â¼
"P µ½¸ùÄ¿Â¼
"K µ½µÚÒ»¸ö½Úµã
"J µ½×îºóÒ»¸ö½Úµã
"u ´ò¿ªÉÏ²ãÄ¿Â¼
"m ÏÔÊ¾ÎÄ¼þÏµÍ³²Ëµ¥£¨Ìí¼Ó¡¢É¾³ý¡¢ÒÆ¶¯²Ù×÷£©
"? °ïÖú
"q ¹Ø±Õ
=======
"o æ‰“å¼€å…³é—­æ–‡ä»¶æˆ–è€…ç›®å½•
"t åœ¨æ ‡ç­¾é¡µä¸­æ‰“å¼€
"T åœ¨åŽå°æ ‡ç­¾é¡µä¸­æ‰“å¼€
"! æ‰§è¡Œæ­¤æ–‡ä»¶
"p åˆ°ä¸Šå±‚ç›®å½•
"P åˆ°æ ¹ç›®å½•
"K åˆ°ç¬¬ä¸€ä¸ªèŠ‚ç‚¹
"J åˆ°æœ€åŽä¸€ä¸ªèŠ‚ç‚¹
"u æ‰“å¼€ä¸Šå±‚ç›®å½•
"m æ˜¾ç¤ºæ–‡ä»¶ç³»ç»Ÿèœå•ï¼ˆæ·»åŠ ã€åˆ é™¤ã€ç§»åŠ¨æ“ä½œï¼‰
"? å¸®åŠ©
"q å…³é—­
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92

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
<<<<<<< HEAD
" ÏÔÊ¾tabºÍ¿Õ¸ñ
set list
" ÉèÖÃtabºÍ¿Õ¸ñÑùÊ½
set lcs=tab:\|\ ,nbsp:%,trail:-
" Éè¶¨ÐÐÊ×tabÎª»ÒÉ«
highlight LeaderTab guifg=#666666
" Æ¥ÅäÐÐÊ×tab
=======
" æ˜¾ç¤ºtabå’Œç©ºæ ¼
set list
" è®¾ç½®tabå’Œç©ºæ ¼æ ·å¼
set lcs=tab:\|\ ,nbsp:%,trail:-
" è®¾å®šè¡Œé¦–tabä¸ºç°è‰²
highlight LeaderTab guifg=#666666
" åŒ¹é…è¡Œé¦–tab
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
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

<<<<<<< HEAD
" NeoSnippet Setting
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


=======
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
set background=dark
colorscheme molokai

set guifont=YaHei_Consolas_Hybrid:h13:cGB2312
set gfw=YaHei_Consolas_Hybrid:h13:cANSI

set nu
set clipboard+=unnamed

<<<<<<< HEAD
" ÎÒµÄ×´Ì¬ÐÐÏÔÊ¾µÄÄÚÈÝ£¨°üÀ¨ÎÄ¼þÀàÐÍºÍ½âÂë£©
set statusline=%F%m%r%h%w\ [%{&ff}\ \|\ %Y\ \|\ %l,%v\ %p%%]
" ×ÜÊÇÏÔÊ¾×´Ì¬ÐÐ
set laststatus=2
" ÃüÁîÐÐ£¨ÔÚ×´Ì¬ÐÐÏÂ£©µÄ¸ß¶È£¬Ä¬ÈÏÎª1£¬ÕâÀïÊÇ2
=======
" æˆ‘çš„çŠ¶æ€è¡Œæ˜¾ç¤ºçš„å†…å®¹ï¼ˆåŒ…æ‹¬æ–‡ä»¶ç±»åž‹å’Œè§£ç ï¼‰
set statusline=%F%m%r%h%w\ [%{&ff}\ \|\ %Y\ \|\ %l,%v\ %p%%]
" æ€»æ˜¯æ˜¾ç¤ºçŠ¶æ€è¡Œ
set laststatus=2
" å‘½ä»¤è¡Œï¼ˆåœ¨çŠ¶æ€è¡Œä¸‹ï¼‰çš„é«˜åº¦ï¼Œé»˜è®¤ä¸º1ï¼Œè¿™é‡Œæ˜¯2
>>>>>>> 4b18e3fc0f002354eaffbd67e8101f95be620d92
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
