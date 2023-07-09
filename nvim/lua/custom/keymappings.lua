vim.g.mapleader = ' '

-- easier split nav
-- vim.keymap.set('n', '<C-H>', ':<C-U>TmuxNavigateLeft<cr>', {})
-- vim.keymap.set('n', '<C-J>', ':<C-U>TmuxNavigateDown<cr>', {})
-- vim.keymap.set('n', '<C-K>', ':<C-U>TmuxNavigateUp<cr>', {})
-- vim.keymap.set('n', '<C-L>', ':<C-U>TmuxNavigateRight<cr>', {})

-- tab navigation
vim.keymap.set('n', '<C-[>', vim.cmd.tabp, {})
vim.keymap.set('n', '<C-]>', vim.cmd.tabn, {})

-- copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y', {})
vim.keymap.set('v', '<leader>y', '"+y', {})

-- paste without copying
vim.keymap.set('n', '<leader>p', '"+y', {})

-- delete to void
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- move line in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- stay in center screen while fast scrolling
vim.keymap.set('n', '<C-D>', "<C-D>zz")
vim.keymap.set('n', '<C-U>', "<C-U>zz")
