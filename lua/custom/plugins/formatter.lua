return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- format_on_save = function(bufnr)
      --   local disable_filetypes = { c = true, cpp = true }
      --   return {
      --     timeout_ms = 500,
      --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      --   }
      -- end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- You can use 'stop_after_first' to run the first available formatter from the list
        css = { { 'prettierd', 'prettier', stop_after_first = true } },
        scss = { { 'prettierd', 'prettier', stop_after_first = true } },
        javascript = { { 'prettierd', 'prettier', stop_after_first = true } },
        typescript = { { 'prettierd', 'prettier', stop_after_first = true } },
        javascriptreact = { { 'prettierd', 'prettier', stop_after_first = true } },
        typescriptreact = { { 'prettierd', 'prettier', stop_after_first = true } },
        php = { 'pint', 'php_cs_fixer', stop_after_first = true },
        graphql = { { 'prettierd', 'prettier', stop_after_first = true } },
        json = { { 'prettierd', 'prettier', stop_after_first = true } },
      },
    },
  },
}
