-- leader
vim.g.mapleader = " "

-- show line indentations
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.mouse = "a"
vim.o.wrap = false

vim.o.swapfile = false

vim.o.clipboard = "unnamed"

-- line numbers
vim.o.number = true
vim.cmd([[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]])

-- Open new split panes to right and bottom, which feels more natural
vim.o.splitbelow = true
vim.o.splitright = true

-- shortcut to save file
map("n","<Esc><Esc>",":w<CR>")

-- colors
vim.g.solarized_termtrans = 1
vim.o.background = "dark"

-- persistant undo
vim.cmd([[
if !isdirectory($HOME."/.nvim/undodir")
    call mkdir($HOME."/.nvim/undodir", "p", 0700)
endif
]])

-- undo buffer
vim.o.undodir = HOME.."/.nvim/undodir"
vim.o.undofile = true
vim.o.undolevels = 1000 -- maximum number of changes that can be undone
vim.o.undoreload = 10000 -- maximum number lines to save for undo on a buffer reload

