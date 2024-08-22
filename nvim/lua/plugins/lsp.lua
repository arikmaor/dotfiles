return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gr", false }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>rr",
        function()
          if vim.bo.filetype == "cs" then
            require("omnisharp_extended").telescope_lsp_references()
          else
            require("telescope.builtin").lsp_references()
          end
        end,
        desc = "Find References",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = {},
      },
    },
  },
}
