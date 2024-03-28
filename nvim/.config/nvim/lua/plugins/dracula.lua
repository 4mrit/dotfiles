return {
  "Mofiqul/dracula.nvim",
  config = function()
    require("dracula").setup {
      colors = {
        bg = "#1e1e2e",
        menu = "#1e1e2e",
      },
    }
    vim.cmd.colorscheme "dracula"
  end,
}
