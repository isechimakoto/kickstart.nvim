return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- config = function()
    -- vim.cmd 'colorscheme rose-pine'
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    -- require('rose-pine').setup {
    --   highlight_groups = {
    --     TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
    --     TelescopeNormal = { bg = 'none' },
    --     TelescopePromptNormal = { bg = 'none' },
    --     TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
    --     TelescopeSelection = { fg = 'text', bg = 'none' },
    --     TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
    --   },
    -- }
    -- end,
  },
  { 'rebelot/kanagawa.nvim' },
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle Undotree' },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
        direction = 'float',
      }

      -- local Terminal = require('toggleterm.terminal').Terminal
      -- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
      --
      -- function _lazygit_toggle()
      --     lazygit:toggle()
      -- end
      --
      -- vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

      function _set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua _set_terminal_keymaps()'
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        detection_methods = { 'pattern' },
        exclude_dirs = { '**/node_modules/*' },
      }
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  {
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  {
    'junegunn/fzf',
    -- run = function()
    --   vim.fn['fzf#install']()
    -- end,
  },
  { 'vim-denops/denops.vim' },
  {
    'shuntaka9576/preview-asciidoc.vim',
    dependencies = {
      'vim-denops/denops.vim',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'johmsalas/text-case.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('textcase').setup {}
      require('telescope').load_extension 'textcase'
    end,
    keys = {
      '<leader>c',
      { '<leader>c.', '<cmd>TextCaseOpenTelescope<CR>', mode = { 'n', 'x' }, desc = 'Telescope' },
      { '<leader>cc', "<cmd>lua require('textcase').current_word('to_camel_case')<CR>", mode = { 'n', 'x' }, desc = 'to_camel_case' },
      { '<leader>cs', "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", mode = { 'n', 'x' }, desc = 'to_snake_case' },
      { '<leader>c-', "<cmd>lua require('textcase').current_word('to_dash_case')<CR>", mode = { 'n', 'x' }, desc = 'to_dash_case' },
      { '<leader>cT', "<cmd>lua require('textcase').current_word('to_title_dash_case')<CR>", mode = { 'n', 'x' }, desc = 'to_title_dash_case' },
      { '<leader>cC', "<cmd>lua require('textcase').current_word('to_constant_case')<CR>", mode = { 'n', 'x' }, desc = 'to_constant_case' },
      { '<leader>cd', "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", mode = { 'n', 'x' }, desc = 'to_dot_case' },
      { '<leader>cw', "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", mode = { 'n', 'x' }, desc = 'to_phrase_case' },
      { '<leader>cp', "<cmd>lua require('textcase').current_word('to_pascal_case')<CR>", mode = { 'n', 'x' }, desc = 'to_pascal_case' },
      { '<leader>ct', "<cmd>lua require('textcase').current_word('to_title_case')<CR>", mode = { 'n', 'x' }, desc = 'to_title_case' },
      { '<leader>c/', "<cmd>lua require('textcase').current_word('to_path_case')<CR>", mode = { 'n', 'x' }, desc = 'to_path_case' },
      { '<leader>cu', "<cmd>lua require('textcase').current_word('to_upper_phrase_case')<CR>", mode = { 'n', 'x' }, desc = 'to_upper_phrase_case' },
      { '<leader>cl', "<cmd>lua require('textcase').current_word('to_lower_phrase_case')<CR>", mode = { 'n', 'x' }, desc = 'to_lower_phrase_case' },
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
        languages = {
          typescript = '// %s',
        },
      }
    end,
  },
}
