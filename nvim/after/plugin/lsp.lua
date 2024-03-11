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

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.md"},
  callback = function()
    if (file_exists('./.eslintrc.yml') or file_exists('./.eslintrc.yaml')) then
      vim.cmd('EslintFixAll')
    end
  end,
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.go", "*.svelte", "*.js", "*.jsx", "*.ts", "*.tsx", "*.md"},
  callback = function()
    vim.lsp.buf.format();
  end,
})

-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
local servers = {
  'tsserver',
  'eslint',
  'dockerls',
  'graphql',
  'html',
  'jsonls',
  'marksman',
  'pyright',
  'terraformls',
  'yamlls',
  'svelte',
  'gopls'
}
lsp.ensure_installed(servers)

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

lsp.setup()
