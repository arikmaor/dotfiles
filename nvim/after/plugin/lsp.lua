local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

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
lsp.setup_servers(servers)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
