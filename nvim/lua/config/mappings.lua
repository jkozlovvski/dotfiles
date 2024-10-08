vim.g.mapleader = " "

vim.keymap.set("", "<leader>c", "<C-w>c")

vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')
vim.keymap.set({ "n", "x" }, "x", '"_x')

vim.keymap.set("", "<leader>/", ":vsplit<CR><C-w>l")

vim.keymap.set('', '<Space>-', ':split<CR><C-w>j')
vim.opt.shell = "/bin/zsh"
