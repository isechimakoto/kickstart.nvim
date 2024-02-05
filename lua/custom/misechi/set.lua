vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 50
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.list = true
vim.opt.listchars = "tab:» ,trail:-"
vim.g.denops_server_addr = '127.0.0.1:12345'
vim.g.netrw_banner = 0

local has = vim.fn.has
local is_mac = has "mac"
local is_win = has "win32"
local is_linux = has "linux"

if is_mac == 1 then
  vim.opt.clipboard:append { 'unnamedplus' }
end

if is_win == 1 then
  vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end

if is_linux == 1 then
  vim.g.clipboard = {
    name = "xsel_override",
    copy = {
      ["+"] = "xsel --input --clipboard",
      ["*"] = "xsel --input --primary",
    },
    paste = {
      ["+"] = "xsel --output --clipboard",
      ["*"] = "xsel --output --primary",
    },
    cache_enabled = 1,
  }
end
