local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

function M.config()
  local status_ok, toggleterm = pcall(require, "toggleterm")
  if not status_ok then
    return
  end

 -- TODO - Add alt 1/2/3 bindings 
  toggleterm.setup {
    size = function(term)
      if term.direction == "horizontal" then
        return 12
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
    },
  }

  function _G.set_terminal_keymaps()
    -- errors if not here, but keybindings in keybinds.lua
  end

  -- vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    on_open = function (term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\>", "<cmd>close<CR>", {noremap = true, silent = true})
    end
  }

  local horiz = Terminal:new {
    hidden = true,
    direction = "horizontal",
    on_open = function (term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<M-1>", "<cmd>close<CR>", {noremap = true, silent = true})
    end
  }

  local vert = Terminal:new {
    hidden = true,
    direction = "vertical",
    on_open = function (term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<M-2>", "<cmd>close<CR>", {noremap = true, silent = true})
    end
  }

  local ptpython = Terminal:new {
    cmd = "ptipython",
    hidden = true,
    on_open = function (term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\>", "<cmd>close<CR>", {noremap = true, silent = true})
    end
  }
  
  function _HORIZ_TOGGLE()
    horiz:toggle()
  end

  function _VERT_TOGGLE()
    vert:toggle()
  end

  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end

  function _PYTHON_TOGGLE()
    ptpython:toggle()
  end
end

return M
