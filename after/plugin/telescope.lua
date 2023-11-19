local telescope = require('telescope')
telescope.load_extension('projects')
telescope.load_extension('harpoon')
telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').oldfiles, { desc = '[ ] Find recently opened files' })
vim.keymap.set('n', '<leader>bf', require('telescope.builtin').buffers, { desc = 'Find existing [B]uffers [F]iles' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_status, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').live_grep, { desc = '[S]earch by [T]ext' })
vim.keymap.set('n', '<leader>ls', require('telescope.builtin').lsp_document_symbols, { desc = 'Search [L]SP Document [S]ymbols' })

vim.keymap.set('n', '<leader>P', function()
  vim.cmd('Telescope projects')
end)

vim.keymap.set('n', '<leader>e', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = vim.fn.expand('%:p:h'),
    cwd_to_path = true,
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'insert',
    layout_config = { width = 80 }
  })
end)

