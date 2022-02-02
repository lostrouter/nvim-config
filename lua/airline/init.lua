
-- airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme='solarized'

vim.cmd([[
let g:airline_mode_map = {
  \ 'c': 'C',
  \ 'n': 'N',
  \ 'V': 'V', 
  \ 'i': 'I'}
]])


vim.cmd([[
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z = "%2l/%L☰%2v"
]])
