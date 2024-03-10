return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'

      telescope.setup {
        defaults = {
          layout_strategy = 'vertical',
          layout_config = {
            preview_cutoff = 5,
          },
          path_display = {
            shorten = {
              len = 5,
              exclude = { 1, 2, 3, -1 },
            },
          },
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-n>'] = actions.cycle_history_next,
              ['<C-p>'] = actions.cycle_history_prev,
            },
            n = {
              ['q'] = actions.close,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(telescope.load_extension, 'projects')
      pcall(telescope.load_extension, 'harpoon')
      pcall(telescope.load_extension, 'file_browser')
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sW', function()
        local word = vim.fn.expand '<cWORD>'
        builtin.grep_string { search = word }
      end, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', function()
        builtin.buffers { show_all_buffers = false, only_cwd = true, sort_lastused = true }
      end, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing [B]uffers [F]iles' })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      -- vim.keymap.set('n', '<leader>gf', builtin.git_status, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files {
          cwd = vim.fn.stdpath 'config',
        }
      end, { desc = '[S]earch [N]eovim files' })

      vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = 'Search [L]SP Document [S]ymbols' })

      vim.keymap.set('n', '<leader>P', function()
        vim.cmd 'Telescope projects'
      end)

      vim.keymap.set('n', '<leader>e', function()
        telescope.extensions.file_browser.file_browser {
          path = '%:p:h',
          cwd = vim.fn.expand '%:p:h',
          cwd_to_path = true,
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = 'insert',
          layout_config = { width = 80 },
        }
      end)
    end,
  },
  { 'nvim-telescope/telescope-file-browser.nvim' },
}
