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
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = true, -- enable transparency
      theme = 'lotus',
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none', -- remove background for gutter
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        local makeDiagnosticColor = function(color)
          local c = require 'kanagawa.lib.color'
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.85):to_hex() }
        end

        return {
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          TelescopePromptBorder = { bg = 'none' },
          TelescopeResultsBorder = { bg = 'none' },
          TelescopePreviewBorder = { bg = 'none' },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
      end,
    },
  },
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

  -- { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  { 'junegunn/fzf' },

  {
    'tigion/nvim-asciidoc-preview',
    ft = { 'asciidoc' },
    build = 'cd server && npm install',
    opts = {
      server = {
        converter = 'cmd',
      },
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
      'ga',
      { 'ga.', '<cmd>TextCaseOpenTelescope<CR>', mode = { 'n', 'x' }, desc = 'Telescope' },
      { 'gac', "<cmd>lua require('textcase').current_word('to_camel_case')<CR>", mode = { 'n', 'x' }, desc = 'to_camel_case' },
      { 'gas', "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", mode = { 'n', 'x' }, desc = 'to_snake_case' },
      { 'ga-', "<cmd>lua require('textcase').current_word('to_dash_case')<CR>", mode = { 'n', 'x' }, desc = 'to_dash_case' },
      { 'gaT', "<cmd>lua require('textcase').current_word('to_title_dash_case')<CR>", mode = { 'n', 'x' }, desc = 'to_title_dash_case' },
      { 'gaC', "<cmd>lua require('textcase').current_word('to_constant_case')<CR>", mode = { 'n', 'x' }, desc = 'to_constant_case' },
      { 'gad', "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", mode = { 'n', 'x' }, desc = 'to_dot_case' },
      { 'gaw', "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", mode = { 'n', 'x' }, desc = 'to_phrase_case' },
      { 'gap', "<cmd>lua require('textcase').current_word('to_pascal_case')<CR>", mode = { 'n', 'x' }, desc = 'to_pascal_case' },
      { 'gat', "<cmd>lua require('textcase').current_word('to_title_case')<CR>", mode = { 'n', 'x' }, desc = 'to_title_case' },
      { 'ga/', "<cmd>lua require('textcase').current_word('to_path_case')<CR>", mode = { 'n', 'x' }, desc = 'to_path_case' },
      { 'gau', "<cmd>lua require('textcase').current_word('to_upper_phrase_case')<CR>", mode = { 'n', 'x' }, desc = 'to_upper_phrase_case' },
      { 'gal', "<cmd>lua require('textcase').current_word('to_lower_phrase_case')<CR>", mode = { 'n', 'x' }, desc = 'to_lower_phrase_case' },
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
