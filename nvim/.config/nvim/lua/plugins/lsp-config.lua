return {
  -- -------------- Add Additional Servers -------------------- ---
  -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers --
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "csharp_ls", "jdtls", "clangd" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require "lspconfig"

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.csharp_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.jdtls.setup {
        capabilities = capabilities,
      }
      lspconfig.clangd.setup {
        capabilities = capabilities,
      }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, {})
    end,
  },
}
