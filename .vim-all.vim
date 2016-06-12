" for pathogen
" call pathogen#runtime_append_all_bundles() 
" call pathogen#helptags()

""""""""""""""""""""""""""""""
" setting for vundle
""""""""""""""""""""""""""""""
set nocompatible
"filetype off

set rtp+=~/.vim/bundle/vundle/
"set rtp+=~/.vim/bundles/dokuwiki/
set rtp+=~/.vim/bundles/mytemplates/
set rtp+=~/.vim/bundles/c.vim/
call vundle#rc()

Bundle 'gmarik/vundle'

"language
"Bundle 'c.vim'
Bundle 'moin.vim'
Bundle 'sukima/xmledit'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'maxima.vim'
Bundle 'Puppet-Syntax-Highlighting'
" Bundle 'houqp/jpythonfold.vim'
Bundle 'houqp/vim-dokuwiki'
Bundle 'scrooloose/syntastic'

"web dev
Bundle 'lilydjwg/colorizer'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'mattn/emmet-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'KabbAmine/gulp-vim'
Bundle 'ternjs/tern_for_vim'
"Bundle 'jelera/vim-javascript-syntax'

"dev tools
Bundle 'po.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vitalk/vim-simple-todo'
Bundle 'Valloric/YouCompleteMe'


" execute pathogen#infect()
filetype plugin indent on

"Set mapleader
let mapleader = ","
let maplocalleader = ",,"

syntax enable

""""""""""""""""""""""""""""""
" tab and indent
""""""""""""""""""""""""""""""
" expand tab to spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
"show tab 
set list
set listchars=tab:▸\ 

set autoindent
set cindent
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd FileType c,cpp,less setlocal noexpandtab 

set nu
set cursorline              " 突出显示当前行
"set cursorcolumn              " 突出显示当前列
set noignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
"set the number of changes that are remembered
set undolevels=200
set modifiable
set write
set foldenable
set foldmethod=syntax
"highlight Folded ctermbg=black
"highlight Folded ctermfg=darkmagenta
"highlight Folded guibg=white
let loaded_csExplorer = 1		"not load the color preview plugin

"Fast saving
nmap <leader>w :w!<cr>

" find tags file recursively from current directory to root directory
set tags=tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch	"search every word you type
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
map <silent> <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto motion for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"工作目录随文件变
"autocmd BufEnter * cd %:p:h
set autochdir
" Set to auto read when a file is changed from the outside
set autoread
" reload vimrc when it is changed
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .gvimrc source ~/.gvimrc
autocmd! bufwritepost .vim-all.vim source ~/.vim/.vim-all.vim
" input method auto close
autocmd! InsertLeave * set imdisable
autocmd! InsertEnter * set noimdisable

" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

"for omnicppcomplete
set nocp
filetype plugin on

""""""""""""""""""""""""""""""
" omni
""""""""""""""""""""""""""""""
imap <C-L> <C-x><C-o>
set completeopt=longest,menu

let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1



""""""""""""""""""""""""""""""
" vim-latex	
""""""""""""""""""""""""""""""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


""""""""""""""""""""""""""""""
"	use vim in man page
""""""""""""""""""""""""""""""
let $PAGER=''


""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 


""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap CTRL-F1 :!cts<cr>
"F5 for compling
nmap <M-F5> :make<cr>
"jumpping between the errors
nmap <M-F7> :cn<cr>
nmap <M-F8> :cp<cr>

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"toggle hex mode
map <leader>h :call ToggleHexMode()<cr>

""""""""""""""""""""""""""""""
" Command mode related
""""""""""""""""""""""""""""""
"Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-F> <Right>
cnoremap <C-B> <left>

""""""""""""""""""""""""""""""
" abbreviations for spelling correct
""""""""""""""""""""""""""""""
iab szie size
iab SZIE SIZE

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
"set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


""""""""""""""""""""""""""""""
" Toggle hex mode
""""""""""""""""""""""""""""""
let s:hexMode = "N"
function! ToggleHexMode()
  if s:hexMode == "Y"
    %!xxd -r
    let s:hexMode = "N"
  else
    %!xxd
    let s:hexMode = "Y"
  endif
endfunction

""""""""""""""""""""""""""""""
" emmet setting
""""""""""""""""""""""""""""""
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"mapping esc"
imap jj <Esc>

"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function! AddTitle()
    call append(0,"/*****************************************************************************")
    call append(1,"#=============================================================================")
    call append(2,"# Author: kuanmin.hkm - kuanmin.hkm@alibaba-inc.com")
    call append(3,"#")
    call append(4,"# Tel : 81168376")
    call append(5,"#")
    call append(6,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"#")
    call append(8,"# Filename: ".expand("%:t"))
    call append(9,"#")
    call append(10,"# Description: ")
    call append(11,"#")
    call append(12,"#============================================================================")
    call append(13,"****************************************************************************/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function! UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function! TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction


""""""""""""""""""""""""""""""
" Toggle NERD_tree
""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>



" let JSHintUpdateWriteOnly=1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jsx_checkers = ['eslint']
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntaxtic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
"
" tern
let g:tern_map_keys=1
let g:is_show_argument_hints_enabled=1

"
" jstplt
command! -nargs=1 JSTemplate call JSTemplate#createTemplate(<f-args>)
