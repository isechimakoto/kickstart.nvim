---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
  local conform = require 'conform'
  for i = 1, select('#', ...) do
    local formatter = select(i, ...)
    if conform.get_formatter_info(formatter, bufnr).available then
      return formatter
    end
  end
  return select(1, ...)
end

local function expandFormatters(formatters)
  return function(bufnr)
    local result = {}
    for i = 1, #formatters do
      local formatter = formatters[i]
      if type(formatter) == 'table' then
        result[i] = first(bufnr, unpack(formatter))
      else
        result[i] = formatter
      end
    end
    return result
  end
end

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

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
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local disable_filetypes = { c = true, cpp = true, kotlin = true }
        return {
          timeout_ms = 3000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = expandFormatters { 'stylua' },
        css = expandFormatters { 'prettierd', 'prettier' },
        scss = expandFormatters { 'prettierd', 'prettier' },
        javascript = expandFormatters { 'prettierd', 'prettier' },
        typescript = expandFormatters { 'prettierd', 'prettier' },
        javascriptreact = expandFormatters { 'prettierd', 'prettier' },
        typescriptreact = expandFormatters { 'prettierd', 'prettier' },
        vue = expandFormatters { 'prettierd', 'prettier' },
        php = expandFormatters { 'pint' },
        graphql = expandFormatters { 'prettierd', 'prettier' },
        json = expandFormatters { 'prettierd', 'prettier' },
        python = expandFormatters { 'black' },
      },
    },
  },
}
