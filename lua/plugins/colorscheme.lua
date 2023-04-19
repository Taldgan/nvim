local M = {
-- "folke/tokyonight.nvim",
  "nordtheme/vim",
  lazy = false,
  priority = 1000,         -- folke mentions this is necessary to ensure its loaded first
}

-- Module name, gets yoinked in init.lua to set colorscheme 

-- M.name = "tokyonight-moon"
M.name = "nord"
function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
