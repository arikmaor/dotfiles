local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "O", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "o", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  vim.keymap.set("n", "<2-LeftMouse>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  vim.keymap.set("n", "<CR>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>v",
      function()
        require("nvim-tree.api").tree.toggle()
      end,
      desc = "Toggle NvimTree",
    },
    {
      "<leader>b",
      function()
        require("nvim-tree.api").tree.focus()
      end,
      desc = "Focus NvimTree",
    },
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = on_attach,
      update_focused_file = {
        enable = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end,
}
