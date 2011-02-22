" Filename: iautoscroll.vim
" Author: Yu Yuwei <acevery@gmail.com>
" Verson: 0.6
" Last Modify: Dec 19, 2008
" Function: Scrolling to center when cursor hit the last/first line in window
"      while inserting
" Usage: put this file into ~/.vim/plugin,
"        in your ~/.vimrc, let g:IAutoScrollMode="<mode>", where <mode>
"        is "scroll" for auto scroll at last/first line,
"        "keep" for keep IAutoScrollLines below/above 
"        "off" to disable this plugin.
"        let g:IAutoScrollLines=number, where number ={0,1,2,3,...}.
"        number=0 (default) means scroll to center,
"        number=5 means scroll up/down 5 lines.
"        when number is bigger than half of the window height,
"        we just scroll to center
" Changlog:
"   0.6: Dec 19, 2008
"       Add g:IAutoScrollLines Variable
"       Add "keep" mode in g:IAutoScrollMode
"       rename "on" mode to "scroll"
"   0.5: Dec 16, 2008
"       Add scrolling when cursor hit the top of screen
"       remove "top" option, only scroll to center
"   0.4: Dec 12, 2008
"       Move the line and col check into if clause, 
"       Which is a little overhead before if :)
"   0.3: Oct 06, 2008
"       Fix logical error using "off"
"       Move cursor to original place after scrolling
"   0.2: Sep 20, 2008
"       Support to scroll to top
" ----------
"

if !exists("IAutoScrollMode")
    let IAutoScrollMode = "scroll"
endif

" the lines we scroll, 0 means scroll to center of windows,
" number > 0, means scroll number lines.
" when number is bigger than half of the window height,
" we just scroll to center

if !exists("IAutoScrollLines")
    let IAutoScrollLines=0
endif

autocmd! CursorMovedI * silent call ICheck_Scroll()

function ICheck_Scroll()
    " we only check scroll when enabled:)
    if g:IAutoScrollMode == "scroll"
        " first, get the line number in window
        let cursor_line_no = winline()
        " second, get the window height
        let winht = winheight(winnr())
        " if we hit the bottom,
        if cursor_line_no == winht || cursor_line_no == 1
            " now store get the current line and column
            let cur_line = line('.')
            let cur_col = col('.')
            " OK, we are ready to move :)
            if g:IAutoScrollLines == 0 || g:IAutoScrollLines >= winht/2
                " default behavior
                exec "normal zz"
            else
                " follow user's config
                let l:scroll_lines = g:IAutoScrollLines
                " now check is on bottom or top
                if cursor_line_no == winht
                    " now do the scroll
                    exec "normal ".l:scroll_lines."j".l:scroll_lines."k"
                else
                    exec "normal ".l:scroll_lines."k".l:scroll_lines."j"
                endif
            endif
            " we need move cursor back to the original place,
            " otherwise insert mode in new line
            " would put cursor one space ahead. 
            call cursor(cur_line,cur_col)
        endif
    elseif g:IAutoScrollMode == "keep" && g:IAutoScrollLines > 0
        " first, get the line number in window
        let cursor_line_no = winline()
        " second, get the window height
        let winht = winheight(winnr())
        " prepare local variable to keep lines
        if g:IAutoScrollLines > (winht-2)/2
            let l:keeplines = (winht-2)/2
        else
            let l:keeplines = g:IAutoScrollLines
        endif

        if cursor_line_no >= winht+1 - l:keeplines || cursor_line_no <= l:keeplines
            " we are in lines keep zone
            let windict = winsaveview()
            if cursor_line_no <= l:keeplines 
                let windict["topline"] -=  l:keeplines - cursor_line_no
                if windict["topline"] < 0
                    let windict["topline"] = 0
                endif
            else
                let windict["topline"] += cursor_line_no - (winht-l:keeplines)
            endif
            call winrestview(windict)

        "elseif cursor_line_no <= l:keeplines 
        endif
    endif
endfunction
