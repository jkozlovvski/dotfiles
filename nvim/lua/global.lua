vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.updatetime = 300

vim.opt.scrolloff = 8
vim.opt.autochdir = true
vim.opt.signcolumn= 'no'


-- show where nvim looks for packages
function show_pack_paths()
  vim.tbl_map(print, vim.opt.packpath:get())
end
