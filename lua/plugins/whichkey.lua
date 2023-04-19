local M = {
  "folke/which-key.nvim",
}

-- TODO - create proper prefix labels & configuration for which-key

function M.config()
  local whichkey = require("which-key")

  whichkey.setup({})
  whichkey.register(mappings, opts)
  whichkey.register(vmappings, vopts)
end

return M

