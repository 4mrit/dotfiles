return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters.coreclr = {
      type = "executable",
      command = "/sbin/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          -- local dllpath = vim.fn.input("Path to dll : ", vim.fn.getcwd() .. "/src/bin/Debug/net8.0", "file")
          -- vim.fn.input(dllpath, "", "file")
          -- return dllpath

          -- return vim.fn.getcwd() .. "/bin/Debug/net8.0/FlareHotspotServer.dll"
          -- local files = ls_dir(vim.fn.getcwd() .. "src/bin/Debug/")
          -- if #files == 1 then
          --      local dotnet_dir = vim.fn.getcwd() .. "src/bin/Debug/" .. files[1]
          --      files = ls_dir(dotnet_dir)
          --      for _, file in ipairs(files) do
          --           if file:match ".*%.dll" then
          --                return dotnet_dir .. "/" .. file
          --           end
          --      end
          -- end

          local cwDir = vim.fn.getcwd() .. "/src/bin/Debug/"
          -- Get all files and directories in CWD
          local cwdContent = vim.split(vim.fn.glob(cwDir .. "/*"), "\n", { trimempty = true })
          if #cwdContent == 1 then
            local dotnet_dir = vim.fn.getcwd() .. "/src/bin/Debug/" .. cwdContent[1]
            local files = vim.split(vim.fn.glob(dotnet_dir .. "/*"), "\n", { trimempty = true })
            for _, file in pairs(files) do
              if file:match ".*%.dll" then
                return vim.fn.input(file, "", "file")
              end
            end

            return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end
          -- Check if specified file or directory exists
          -- local fullNameToCheck = cwDir .. "/" .. nameToCheck
          -- print("Checking for: \"" .. fullNameToCheck .. "\"")
          -- for _, cwdItem in pairs(cwdContent) do
          --      if cwdItem == fullNameToCheck then
          --           return true
          --      end
          -- end
          -- return false
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
          -- return vim.fn.input {
          --   prompt = "dada",
          --   default = vim.fn.getcwd() .. "src/bin/Debug/",
          -- }
        end,
      },
    }

    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<leader>dc", dap.continue, {})
  end,
}
