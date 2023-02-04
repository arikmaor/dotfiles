require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit_no_picker" },
        { key = "O",                              action = "edit" },
      }
    }
  },
  update_focused_file = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

local api = require("nvim-tree.api")

vim.keymap.set('n', '<leader>v', api.tree.toggle)
vim.keymap.set('n', '<leader>b', api.tree.focus)
