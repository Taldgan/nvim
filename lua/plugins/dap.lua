local M = {
  "mfussenegger/nvim-dap",
}

function M.config()
  local dap = require "dap"

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      -- should be /home/YOURUSER/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb
      command = "codelldb",
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  dap.adapters.debugpy = {
    type = "executable",
    command = "/usr/bin/python",
    args = { "-m", "debugpy.adapter", },
    config = { pythonPath = '/usr/bin/python' },
    options = {
      source_filetype = 'python',
    }
  }

  dap.configurations.python = {
    {
      name = 'Launch file',
      type = 'debugpy',
      request = 'launch',
      program = '${file}',
      console = 'integratedTerminal',
      pythonPath = "/usr/bin/python",
    },
  }

  dap.configurations.c = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  dap.configurations.cpp = dap.configurations.c
  dap.configurations.zig = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/zig-out/bin/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
    }
  }
end

return M
