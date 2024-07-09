local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- directory for plugins

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

vim.opt.showmode = false

-- show where nvim looks for packages
function show_pack_paths()
  vim.tbl_map(print, vim.opt.packpath:get())
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "rose-pine" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})