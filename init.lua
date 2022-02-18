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
require('tmuxnav')
require('fzf')
require('airline')
require('NERDTree')
require('ALE')
require('CoC')


-- https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
vim.cmd([[
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
]])



vim.cmd([[
colorscheme solarized
]])


vim.cmd([[
" vim rooter
let g:rooter_patterns = ['.git']
]])

vim.cmd([[
" easymotion hotkeys
" s{char}{char} to move to {char}{char}
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)
" edit nvim config commands
command! -nargs=0 ConfigEdit :exe 'edit '.stdpath('config').'/init.vim'
command! -nargs=0 ConfigSource :source $MYVIMRC
]])

