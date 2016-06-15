if has("autocmd")
augroup autoinsert
  au!
  autocmd BufNewFile Makefile call s:Template("make")
  autocmd BufNewFile *.py call s:Template("python")
  autocmd BufnewFile [^.]*.js call s:Template("javascript")
  autocmd BufNewFile *.singleton.js call s:Template("javascriptSingleton")
  autocmd BufNewFile *.abstract.js call s:Template("javascriptAbstract")
  autocmd BufNewFile *.inherit.js call s:Template("javascriptInherit")
augroup END
endif

function s:javascriptToCamel(templateStr)
  echo a:templateStr

  let l:ret = []
  let l:wordList = split(a:templateStr, "-")
  echo l:wordList
  

  for tmpWord in l:wordList
    echo toupper(strpart(tmpWord, 0, 1)) . strpart(tmpWord, 1, strlen(tmpWord) - 1)
    call add(l:ret, toupper(strpart(tmpWord, 0, 1)) . strpart(tmpWord, 1, strlen(tmpWord) - 1))
  endfor

  return join(l:ret, "")
endfunction

function s:substitudeJavascriptClassName(classNameTemplate)
  let l:fileName = expand('%:t')
  let l:endIdx = stridx(l:fileName, ".")
  let l:className = strpart(l:fileName, 0, l:endIdx)
  let l:classNameCamel = s:javascriptToCamel(l:className)

  execute "%s/" . a:classNameTemplate . "/" . l:classNameCamel . "/g" 
endfunction

function s:javascriptSingleton()
  0r ~/.vim/skeletons/javascriptSingleton.js
  set ft=javascript
  call s:substitudeJavascriptClassName("ClassName")
endfunction

function s:javascriptAbstract()
  0r ~/.vim/skeletons/javascriptAbstract.js
  set ft=javascript
  call s:substitudeJavascriptClassName("ClassName")
endfunction

function s:javascriptInherit()
  0r ~/.vim/skeletons/javascriptInherit.js
  set ft=javascript
  call s:substitudeJavascriptClassName("ChildClass")
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
                elseif (a:argument == "javascript")
                        0r ~/.vim/skeletons/template.js
                        set ft=javascript
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
