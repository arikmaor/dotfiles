vim.g.mapleader = ' '

-- easier split nav
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', {})
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', {})
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', {})
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', {})

-- tab navigation
vim.keymap.set('n', '<C-[>', vim.cmd.tabp, {})
vim.keymap.set('n', '<C-]>', vim.cmd.tabn, {})

-- easier clipboard
vim.keymap.set('n', '<leader>y', '"*y', {})
