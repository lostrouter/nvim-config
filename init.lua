-- key map helpers
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

HOME = os.getenv("HOME")

require('ide')
require('plugins')
require('airline')


-- https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
vim.cmd([[
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
]])

-- nerdtree
vim.cmd([[
let NERDTreeShowHidden = 1
]])

map("n","<C-e>",":NERDTreeToggleVCS<CR>")
map("n","<C-e>r",":NERDTreeRefreshRoot<CR>")
map("n","<C-e>f",":NERDTreeFind<CR>")


vim.cmd([[
colorscheme solarized
]])

vim.cmd([[
" fzf bindings
nnoremap <C-p> :All<Cr>
nnoremap <C-f> :Rg<Cr>
inoremap <C-f> :BLines!<Cr>
" map <C-g> :BCommits!<Cr>
" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
nnoremap <silent> <leader>o :All<cr>

" vim test 
let test#strategy = 'vimux'
" let test#javascript#jest#file_pattern = '(test|spec)\.(ts|tsx|js|jsx)$'
" vim-test mappings
" these 'Ctrl mappings' work well when Caps Lock is mapped to Ctrl
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
]])
-- easier split navigation
vim.cmd([[
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
]])
-- vim tmux navigator key mappings
vim.g.tmux_navigator_no_mappings = 1

vim.cmd([[
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
]])

-- Disable tmux navigator when zooming the Vim pane
vim.g.tmux_navigator_disable_when_zoomed = 1
map("n","<silent> {Previous-Mapping}", ":TmuxNavigatePrevious<cr>")

vim.cmd([[
" vim rooter
let g:rooter_patterns = ['.git']
" ALE settings
let g:ale_linters = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['tsserver', 'eslint', 'prettier'],
      \ 'typescriptreact': ['tsserver', 'eslint', 'prettier'],
      \ 'json': ['prettier', 'eslint'],
      \ 'java': ['eclipselsp']
     \}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'java': ['javac']
      \}
]])
vim.g.ale_sign_warning = '⚠️ '
vim.g.ale_sign_error = '❌'

-- defer lsp stuff to coc
vim.g.ale_disable_lsp = 1
vim.g.ale_fix_on_save = 0

-- coc
vim.cmd([[
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-markdownlint'
  \ ]

nmap <leader>ff :ALEFix<CR>

" hover docs
nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
" prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" coc hot keys
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> g<C-d> :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
" easymotion hotkeys
" s{char}{char} to move to {char}{char}
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)
" edit nvim config commands
command! -nargs=0 ConfigEdit :exe 'edit '.stdpath('config').'/init.vim'
command! -nargs=0 ConfigSource :source $MYVIMRC
]])

