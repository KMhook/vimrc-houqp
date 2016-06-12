if has("autocmd")
augroup autoinsert
  au!
  autocmd BufNewFile Makefile call s:Template("make")
  autocmd BufNewFile *.py call s:Template("python")
  autocmd BufNewFile *.singleton.js call s:Template("javascriptSingleton")
  autocmd BufNewFile *.abstract.js call s:Template("javascriptAbstract")
  autocmd BufNewFile *.inherit.js call s:Template("javascriptInherit")
augroup END
endif

function s:javascriptSingleton()
  0r ~/.vim/skeletons/javascriptSingleton.js
  set ft=javascript
endfunction

function s:javascriptAbstract()
  0r ~/.vim/skeletons/javascriptAbstract.js
  set ft=javascript
endfunction

function s:javascriptInherit()
  0r ~/.vim/skeletons/javascriptInherit.js
  set ft=javascript
endfunction

function s:Template(argument)
        if (a:argument == "help")
                echo "Currently available templates:"
                echo " make             - Makefile Template"
                echo " py               - Python Template"
        else
                " First delete all in the current buffer
                %d

                " The Makefile variants
                if (a:argument == "make")
                        0r ~/.vim/skeletons/template.make
                        set ft=make

                " Stuff for python files
                elseif (a:argument == "python")
                        0r ~/.vim/skeletons/template.py
                        set ft=python
                elseif (a:argument == "javascriptSingleton")
                        call s:javascriptSingleton()                       
                elseif (a:argument == "javascriptAbstract") 
                        call s:javascriptAbstract()
                elseif (a:argument == "javascriptInherit") 
                        call s:javascriptInherit()
                endif

                "silent %!~/.vim/do_header %
        endif
endfunction

command! -nargs=1 Template call s:Template(<f-args>)
