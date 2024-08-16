local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>o', builtin.git_files, {})
vim.keymap.set('n', '<leader>O', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- lsp
vim.keymap.set('n', '<leader>rr', builtin.lsp_references, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})

