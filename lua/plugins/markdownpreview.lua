local M = {
  "iamcco/markdown-preview.nvim",
  event = "BufRead",
  build = function ()
    vim.fn["mkdp#util#install"]()
  end,
}

return M
