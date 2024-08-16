-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del({ "n", "v" }, "s")

-- tab navigation
vim.keymap.set("n", "<leader>[", vim.cmd.tabp, {})
vim.keymap.set("n", "<leader>]", vim.cmd.tabn, {})

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', {})

-- paste without copying
vim.keymap.set("n", "<leader>p", '"+y', {})

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- move line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- stay in center screen while fast scrolling
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
