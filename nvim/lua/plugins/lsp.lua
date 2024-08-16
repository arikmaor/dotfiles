return {
  { import = "lazyvim.plugins.extras.lang.omnisharp" },
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
          require("telescope.builtin").lsp_references()
        end,
        desc = "Find References",
      },
    },
  },
}
