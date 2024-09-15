-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del({ "n", "v" }, "s")

-- tab navigation
vim.keymap.set("n", "<leader>[", vim.cmd.tabp, { desc = "Prev Tab" })
vim.keymap.set("n", "<leader>]", vim.cmd.tabn, { desc = "Next Tab" })

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })

-- move line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- stay in center screen while fast scrolling
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
