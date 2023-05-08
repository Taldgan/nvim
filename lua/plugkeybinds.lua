-- Plugin Keybinds

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Vim-Notify
keymap("n", "<leader>c", [[<cmd>lua require("notify").dismiss({silent = true, pending = true})<CR>]], opts)

-- Alpha
keymap("n", "<leader>;", "<cmd>Alpha<CR>", opts)
-- Automatically open alpha when the last buffer is deleted and only one window left
vim.cmd [[ au BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) && winnr('$') == 1 | exec 'Alpha' | endif ]]

-- Nvim-Tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
-- double mapping bc I'm braindead
keymap("n", "<leader>bf", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>fk", "<cmd>lua require'telescope.builtin'.keymaps{}<CR>", opts)

-- DAP
keymap("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
keymap("n", "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", opts)
keymap("n", "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dT", "<cmd>lua require'dap'.terminate()<cr>", opts)

--BufferLine
keymap("n", "<leader>bb", "<cmd>BufferLinePick<CR>", opts)

-- LSP Keybinds
-- Using Leader (For Telescope)
keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)

--Using Leader (Others)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>Mason<cr>", opts)
-- keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- keymap("n", "<leader>lS", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Using 'g'
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- ToggleTerm (default term keybinding in toggleterm.lua)
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)
keymap("n", "<M-1>", "<cmd>lua _HORIZ_TOGGLE()<CR>", opts)
keymap("n", "<M-2>", "<cmd>lua _VERT_TOGGLE()<CR>", opts)
