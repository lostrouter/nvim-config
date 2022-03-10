vim.cmd([[
" ALE settings
let g:ale_linters = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['tsserver', 'eslint', 'prettier'],
      \ 'typescriptreact': ['tsserver', 'eslint', 'prettier'],
      \ 'json': ['prettier', 'eslint'],
      \ 'java': ['eclipselsp'],
      \ 'python': ['yapf']
     \}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'java': ['javac'],
      \ 'python': ['yapf']
      \}

nmap <leader>ff :ALEFix<CR>
]])
vim.g.ale_sign_warning = '⚠️ '
vim.g.ale_sign_error = '❌'

-- defer lsp stuff to coc
vim.g.ale_disable_lsp = 1
vim.g.ale_fix_on_save = 0
