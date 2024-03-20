return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require 'conform'

      conform.setup {
        -- notify_on_error = false,
        -- format_on_save = {
        --   timeout_ms = 500,
        --   lsp_fallback = true,
        -- },
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { { 'prettierd', 'prettier' } },
          typescript = { { 'prettierd', 'prettier' } },
          php = { 'php_cs_fixer' },
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>lf', conform.format, { desc = 'Format' })
    end,
  },
}

