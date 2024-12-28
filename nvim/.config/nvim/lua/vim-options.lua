vim.cmd "set expandtab"
vim.cmd "set tabstop=2"
vim.cmd "set softtabstop=2"
vim.cmd "set shiftwidth=2"

--Tabs vs Spaces
vim.o.tabstop = 2      -- a TAB char looks like 4 Spaces
vim.o.expandtab = true --pressing tab will insert Spaces
vim.o.softtabstop = 2  -- no of spaces inserted instead of inserting tab
vim.o.shiftwidth = 2   -- no of spaces inserted when indenting
vim.opt.relativenumber = true
-- set system and nvim clipboard to same
-- vim.o.clipboard = "unnamedplus"

vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<ESC>", { desc = "Escape insert mode" })
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", "<TAB>", ":tabn<CR>", {})

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', {})
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p<CR>', {})

vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd> w <CR>", {})
vim.keymap.set({ "n", "i" }, "<C-q>", "<cmd> q <CR>", {})
vim.keymap.set({ "n", "v" }, "<leader>ss", ":CodeSnap<cr>", {})
vim.wo.number = true
vim.treesitter.language.register("xml", "props") -- the xml parser for directory.builds.props

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart highlight yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
