local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

-- TODO - create proper prefix labels & configuration for which-key

function M.config()
  require("which-key").setup {}
end

return M

