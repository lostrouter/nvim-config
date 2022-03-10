-- key map helpers
-- TODO make single helper function
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- nerdtree
vim.cmd([[
let NERDTreeShowHidden = 1
]])

map("n","<C-e>",":NERDTreeToggleVCS<CR>")
map("n","<C-e>r",":NERDTreeRefreshRoot<CR>")
map("n","<C-e>f",":NERDTreeFind<CR>")
-- make tmux nav work correctly
vim.g.NERDTreeMapJumpPrevSibling = ""
vim.g.NERDTreeMapJumpNextSibling = ""
