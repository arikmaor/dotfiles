local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = { omit = { 'gr', 'gd' } }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<leader>ac', function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set('n', '<leader>rr', function()
  --   vim.lsp.buf.references()
  -- end, opts)
end)

-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.js :EslintFixAll]]
vim.cmd [[autocmd BufWritePre *.jsx :EslintFixAll]]
vim.cmd [[autocmd BufWritePre *.ts :EslintFixAll]]
vim.cmd [[autocmd BufWritePre *.tsx :EslintFixAll]]

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
local servers = {
  'sumneko_lua',
  'tsserver',
  'eslint',
  'dockerls',
  'graphql',
  'html',
  'jsonls',
  'marksman',
  'pyright',
  'terraformls',
  'yamlls'
}
lsp.ensure_installed(servers)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
