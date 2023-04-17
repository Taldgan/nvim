require("options")
require("keybinds")


-- Lazy Bootstrapper

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

opts = {
  install = { colorscheme = { require("user.colorscheme").name } },
  defaults = { lazy = true },
  ui = { wrap = "true" },
  checker = { enabled = true },
  change_detection = { enabled = true },
  debug = false,
}

require("lazy").setup(plugins, opts)
