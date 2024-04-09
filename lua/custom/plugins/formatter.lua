return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require 'conform'
      conform.setup {
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          css = { { 'prettierd', 'prettier' } },
          scss = { { 'prettierd', 'prettier' } },
          javascript = { { 'prettierd', 'prettier' } },
          typescript = { { 'prettierd', 'prettier' } },
          javascriptreact = { { 'prettierd', 'prettier' } },
          typescriptreact = { { 'prettierd', 'prettier' } },
          php = { 'php_cs_fixer' },
          graphql = { { 'prettierd', 'prettier' } },
          json = { { 'prettierd', 'prettier' } },
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>lf', conform.format, { desc = 'Format' })
    end,
  },
}
