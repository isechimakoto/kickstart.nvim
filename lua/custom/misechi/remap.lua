vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'dw', 'vb"_d')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>k', '<cmd>colder<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>cnewer<CR>zz')
vim.keymap.set('n', '<leader>S', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Replace the word under the cursor' })
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-c>', "<cmd>let @+ = expand('%')<CR>")
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

local is_linux = vim.fn.has 'linux'

if is_linux == 1 then
  vim.keymap.set('n', 'gx', function()
    local url = vim.fn.expand '<cfile>'
    vim.fn.jobstart({ 'wslview', url }, { detach = true })
  end, { silent = true })
end
