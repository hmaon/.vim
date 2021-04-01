call pathogen#infect() 

syntax on

set nocompatible	" Use Vim defaults (much better!)
set backspace=2		" allow backspacing over everything in insert mode
set ruler
set textwidth=0

set smarttab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set noexpandtab

colorscheme default

filetype plugin on

" autocmd BufNewFile,BufRead /home/greg/OpenXcom/* set noexpandtab


au BufNewFile,BufRead *.tpl     set ft=html

au FileType python call RulesPython()
au FileType html call RulesHtml()
au FileType lisp call RulesLisp()
au FileType make call RulesMake()
au FileType lua call RulesLua()



fun RulesLua()
    call RulesHtml()
    set autoindent
    set smarttab
endfun

fun RulesLisp()
    colorscheme default
    set tabstop=4
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    set smarttab
    set autoindent
endfun

fun RulesHtml()
    set tabstop=8
    set shiftwidth=2
    set softtabstop=2
    set expandtab
endfun

fun RulesPython()
    set cinwords=if,else,while,do,for,switch,def,class,elif,try,except,finally
    set shiftwidth=4
    set softtabstop=4
    set tabstop=8
    set expandtab
    set smarttab
    set autoindent
endfun

fun RulesMake()
    set shiftwidth=8
    set nosmartindent
    set nosmarttab
    set noexpandtab
endfun

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make

" colorscheme delek

" from
" http://bsdboy.west.spy.net/cgi-bin/viewarch.cgi/dustin@spy.net--projects-2004/misc--dotfiles--1.0--patch-18/.vimrc
"

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
au! Syntax vala source $VIM/vim71/syntax/cs.vim

" from http://vim.wikia.com/wiki/Online_documentation_for_word_under_cursor
function! OnlineDoc()
  if &ft =~ "cpp"
    let s:urlTemplate = "http://doc.trolltech.com/4.1/%.html"
  elseif &ft =~ "ruby"
    let s:urlTemplate = "http://www.ruby-doc.org/core/classes/%.html"
  elseif &ft =~ "perl"
    let s:urlTemplate = "http://perldoc.perl.org/functions/%.html"
  else
    return
  endif
  let s:browser = "\"D:\\Applications\\Mozilla Firefox\\firefox.exe\""
  let s:wordUnderCursor = expand("<cword>")
  let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
  let s:cmd = "silent !start " . s:browser . " " . s:url
  execute s:cmd
endfunction
" Online doc search.
map <silent> <M-d> :call OnlineDoc()<CR>

set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%{fugitive#statusline()} " git branch
set statusline+=%y      "filetype
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl330
