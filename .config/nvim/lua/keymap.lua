-- 'n' : normal mode
-- 'i' : insert mode
-- 'x' : visual mode

-- Indentation
vim.keymap.set('n', '>', '>>', { desc = 'Indent right' })
vim.keymap.set('n', '<', '<<', { desc = 'Indent left' })
vim.keymap.set('x', '>', '>gv', { desc = 'Indent right' })
vim.keymap.set('x', '<', '<gv', { desc = 'Indent left' })

-- Save file
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close file' })

-- Split window
vim.keymap.set('n', '<C-w>s', ':split<CR><C-w>j', {
  noremap = true,
  desc = 'Split window horizontally',
})
vim.keymap.set('n', '<C-w>v', ':vsplit<CR><C-w>l', {
  noremap = true,
  desc = 'Split window vertically',
})

-- Terminal window
vim.keymap.set('n', '<leader>t', ':term<CR>', {
  desc = 'Open terminal window',
})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {
  desc = 'Exit terminal window',
})
