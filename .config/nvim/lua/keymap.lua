-- 'n' : normal mode
-- 'i' : insert mode
-- 'x' : visual mode

vim.g.mapleader = ","

-- Indentation
vim.keymap.set('n', '>', '>>')
vim.keymap.set('n', '<', '<<')
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')

-- Save file
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- Split window
vim.keymap.set('n', '<C-w>s', ':split<CR><C-w>j', { noremap = true })
vim.keymap.set('n', '<C-w>v', ':vsplit<CR><C-w>l', { noremap = true })
