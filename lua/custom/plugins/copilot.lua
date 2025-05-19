return {
  {
    'github/copilot.vim',
    event = 'VeryLazy',
    config = function()
      -- enable copilot for specific filetypes
      vim.g.copilot_filetypes = {
        ['TelescopePrompt'] = false,
      }

      -- Setup keymaps
      local keymap = vim.keymap.set
      local opts = { silent = true }

      -- Copilot toggle
      vim.keymap.set('n', '<leader>cp', function()
        local copilot_status = vim.g.copilot_enabled
        if copilot_status then
          vim.g.copilot_enabled = false
          vim.notify('Copilot disabled', 2, { title = 'Copilot' })
        else
          vim.g.copilot_enabled = true
          vim.notify('Copilot enabled', 2, { title = 'Copilot' })
        end
      end, { desc = 'Toggle Copilot' })

      -- Set <C-y> to accept copilot suggestion
      vim.g.copilot_no_tab_map = true
      keymap('i', '<C-y>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

      -- Set <C-i> to accept line
      keymap('i', '<C-i>', '<Plug>(copilot-accept-line)', opts)

      -- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
      keymap('i', '<C-j>', '<Plug>(copilot-next)', opts)
      keymap('i', '<C-k>', '<Plug>(copilot-previous)', opts)
      keymap('i', '<C-l>', '<Plug>(copilot-suggest)', opts)

      -- Set <C-d> to dismiss suggestion
      keymap('i', '<C-d>', '<Plug>(copilot-dismiss)', opts)
    end,
  },
}
