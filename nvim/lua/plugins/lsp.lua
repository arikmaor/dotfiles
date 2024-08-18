return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
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
}
