local system_theme = os.execute('defaults read -g AppleInterfaceStyle')
local is_dark = system_theme == 0

if is_dark then
  vim.cmd("colorscheme rose-pine-moon")
else
  vim.cmd("colorscheme rose-pine-dawn")
  vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci:ver25-Cursor/lCursor")
end
