vim.cmd "set expandtab"
vim.cmd "set tabstop=2"
vim.cmd "set softtabstop=2"
vim.cmd "set shiftwidth=2"
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", "<TAB>", ":tabn<CR>", {})
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd> w <CR>", {})
vim.keymap.set({ "n", "i" }, "<C-q>", "<cmd> q <CR>", {})
--:lua = vim.lsp.buf.format()<CR>"
vim.wo.number = true
vim.treesitter.language.register("xml", "props") -- the xml parser for directory.builds.props
