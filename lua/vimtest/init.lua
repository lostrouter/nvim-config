vim.cmd([[
" vim test 
let test#strategy = 'vimux'
" let test#javascript#jest#file_pattern = '(test|spec)\.(ts|tsx|js|jsx)$'
" vim-test mappings
" these 'Ctrl mappings' work well when Caps Lock is mapped to Ctrl
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
]])

