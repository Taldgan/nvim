-- Plugin Keybinds
--
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)


-- Nvim-Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")
