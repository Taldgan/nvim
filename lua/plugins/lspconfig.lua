local M = {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}

local cmp_nvim_lsp = require "cmp_nvim_lsp"
function M.config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

  local lspconfig = require "lspconfig"
  local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "sumneko_lua" then
      client.server_capabilities.documentFormattingProvider = false
    end

    require("illuminate").on_attach(client)
  end

  for _, server in pairs(require("utils").servers) do
    Opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
      Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
    end

    lspconfig[server].setup(Opts)
  end
end

return M
