require'nvim-tree'.setup({
  view = { 
    mappings = {
      list = {
        { key = "<leader><C-e>", action = "edit_in_place" }
      } 
    }
  }
})

require'nvim-web-devicons'.setup()

local g = vim.g

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end


map("n","<C-e>",":NvimTreeToggle<CR>")
map("n","<C-e>r",":NvimTreeRefresh<CR>")
map("n","<C-e>f",":NvimTreeFindFile<CR>")
