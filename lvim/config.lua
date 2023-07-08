-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- write all lunar-vim settings to file: lvim --headless +'lua require("lvim.utils").generate_settings()' +qa && sort -o lv-settings.lua{,}

local tree_api = require("nvim-tree.api")

vim.keymap.set('n', '<leader>v', tree_api.tree.toggle)
vim.keymap.set('n', '<leader>b', tree_api.tree.focus)
