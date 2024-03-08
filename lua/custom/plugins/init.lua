-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  { 'nvim-treesitter/playground' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { 'mbbill/undotree' },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        open_mapping = [[<c-\>]],
        direction = 'float',
      })
    end
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        exclude_dirs = { "**/node_modules/*" },
      }
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  },
  {
    "windwp/nvim-autopairs",
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  { 'junegunn/fzf', run = function()
    vim.fn['fzf#install']()
  end
  },
  { 'mhartington/formatter.nvim' },
  { 'vim-denops/denops.vim' },
  {
    "shuntaka9576/preview-asciidoc.vim",
    dependencies = {
      "vim-denops/denops.vim",
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
    keys = {
      "<leader>c",
      { "<leader>c.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
      { "<leader>cc", "<cmd>lua require('textcase').current_word('to_camel_case')<CR>", mode = { "n", "x" },
        desc = "to_camel_case" },
      { "<leader>cs", "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", mode = { "n", "x" },
        desc = "to_snake_case" },
      { "<leader>c-", "<cmd>lua require('textcase').current_word('to_dash_case')<CR>", mode = { "n", "x" },
        desc = "to_dash_case" },
      { "<leader>cT", "<cmd>lua require('textcase').current_word('to_title_dash_case')<CR>", mode = { "n", "x" },
        desc = "to_title_dash_case" },
      { "<leader>cC", "<cmd>lua require('textcase').current_word('to_constant_case')<CR>", mode = { "n", "x" },
        desc = "to_constant_case" },
      { "<leader>cd", "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", mode = { "n", "x" },
        desc = "to_dot_case" },
      { "<leader>cw", "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", mode = { "n", "x" },
        desc = "to_phrase_case" },
      { "<leader>cp", "<cmd>lua require('textcase').current_word('to_pascal_case')<CR>", mode = { "n", "x" },
        desc = "to_pascal_case" },
      { "<leader>ct", "<cmd>lua require('textcase').current_word('to_title_case')<CR>", mode = { "n", "x" },
        desc = "to_title_case" },
      { "<leader>c/", "<cmd>lua require('textcase').current_word('to_path_case')<CR>", mode = { "n", "x" },
        desc = "to_path_case" },
      { "<leader>cu", "<cmd>lua require('textcase').current_word('to_upper_phrase_case')<CR>", mode = { "n", "x" },
        desc = "to_upper_phrase_case" },
      { "<leader>cl", "<cmd>lua require('textcase').current_word('to_lower_phrase_case')<CR>", mode = { "n", "x" },
        desc = "to_lower_phrase_case" },
    },
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      -- signs = {
      --   add = { text = '+' },
      --   change = { text = '~' },
      --   delete = { text = '_' },
      --   topdelete = { text = '‾' },
      --   changedelete = { text = '~' },
      -- },
      on_attach = function(bufnr)
        -- vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        -- local gs = package.loaded.gitsigns
        -- vim.keymap.set({ 'n', 'v' }, ']c', function()
        --   if vim.wo.diff then
        --     return ']c'
        --   end
        --   vim.schedule(function()
        --     gs.next_hunk()
        --   end)
        --   return '<Ignore>'
        -- end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        -- vim.keymap.set({ 'n', 'v' }, '[c', function()
        --   if vim.wo.diff then
        --     return '[c'
        --   end
        --   vim.schedule(function()
        --     gs.prev_hunk()
        --   end)
        --   return '<Ignore>'
        -- end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })

        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>gk', function()
          gs.prev_hunk { navigation_message = false }
        end)
        map('n', '<leader>gj', function()
          gs.next_hunk { navigation_message = false }
        end)
        map('n', '<leader>gl', function()
          gs.blame_line { full = true }
        end)
        map('n', '<leader>gp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
        map('n', '<leader>gr', gs.reset_hunk)
        map('n', '<leader>gR', gs.reset_buffer)
        map('n', '<leader>gs', gs.stage_hunk)
        map('n', '<leader>gu', gs.undo_stage_hunk)
        map('n', '<leader>gd', gs.diffthis)
      end,
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },

  { 'JoosepAlviste/nvim-ts-context-commentstring', },


}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- local actions = require('telescope.actions')
-- require('telescope').setup {
--   defaults = {
--     layout_strategy = 'vertical',
--     layout_config = {
--       preview_cutoff = 5,
--     },
--     path_display = 'truncate',
--     mappings = {
--       i = {
--         ["<C-j>"] = actions.move_selection_next,
--         ["<C-k>"] = actions.move_selection_previous,
--         ["<C-n>"] = actions.cycle_history_next,
--         ["<C-p>"] = actions.cycle_history_prev,
--       },
--       n = {
--         ["q"] = actions.close,
--         ["<C-j>"] = actions.move_selection_next,
--         ["<C-k>"] = actions.move_selection_previous,
--       },
--     },
--   },
-- }

-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sW', function()
--   local word = vim.fn.expand('<cWORD>')
--   require('telescope.builtin').grep_string({ search = word })
-- end, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
-- vim.defer_fn(function()
--   require('nvim-treesitter.configs').setup {
--     -- Add languages to be installed here that you want installed for treesitter
--     ensure_installed = {
--       "astro",
--       "bash",
--       "c",
--       "cpp",
--       "css",
--       "go",
--       "graphql",
--       "html",
--       "javascript",
--       "lua",
--       "php",
--       "python",
--       "rust",
--       "scss",
--       "svelte",
--       "tsx",
--       "typescript",
--       "vim",
--       "vimdoc",
--       "vue",
--       "yaml",
--     },
--
--     -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
--     auto_install = false,
--
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     highlight = { enable = true, additional_vim_regex_highlighting = false },
--     indent = { enable = true },
--     incremental_selection = {
--       enable = true,
--       keymaps = {
--         init_selection = '<c-w>',
--         node_incremental = '<c-w>',
--         node_decremental = '<c-s>',
--       },
--     },
--     textobjects = {
--       select = {
--         enable = true,
--         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--         keymaps = {
--           -- You can use the capture groups defined in textobjects.scm
--           ['aa'] = '@parameter.outer',
--           ['ia'] = '@parameter.inner',
--           ['af'] = '@function.outer',
--           ['if'] = '@function.inner',
--           ['ac'] = '@class.outer',
--           ['ic'] = '@class.inner',
--         },
--       },
--       move = {
--         enable = true,
--         set_jumps = true, -- whether to set jumps in the jumplist
--         goto_next_start = {
--           [']m'] = '@function.outer',
--           [']]'] = '@class.outer',
--         },
--         goto_next_end = {
--           [']M'] = '@function.outer',
--           [']['] = '@class.outer',
--         },
--         goto_previous_start = {
--           ['[m'] = '@function.outer',
--           ['[['] = '@class.outer',
--         },
--         goto_previous_end = {
--           ['[M'] = '@function.outer',
--           ['[]'] = '@class.outer',
--         },
--       },
--       -- swap = {
--       --   enable = true,
--       --   swap_next = {
--       --     ['<leader>a'] = '@parameter.inner',
--       --   },
--       --   swap_previous = {
--       --     ['<leader>A'] = '@parameter.inner',
--       --   },
--       -- },
--     },
--   }
-- end, 0)
--
--
-- -- [[ Configure LSP ]]
-- --  This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--   -- NOTE: Remember that lua is a real programming language, and as such it is possible
--   -- to define small helper and utility functions so you don't have to repeat yourself
--   -- many times.
--   --
--   -- In this case, we create a function that lets us more easily define mappings specific
--   -- for LSP related items. It sets the mode, buffer and description for us each time.
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = 'LSP: ' .. desc
--     end
--
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--   end
--
--   nmap('<leader>lr', vim.lsp.buf.rename, '[R]e[n]ame')
--   nmap('<leader>la', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--   nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--   nmap('gr', function()
--     require('telescope.builtin').lsp_references({ show_line = false })
--   end, '[G]oto [R]eferences')
--   nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--   nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--   nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--   -- See `:help K` for why this keymap
--   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--   -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--   -- Lesser used LSP functionality
--   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
-- end
--
-- -- document existing key chains
-- require('which-key').register {
--   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
--   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
--   ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
--   ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
--   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
--   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
--   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
-- }
--

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
-- local servers = {
--   -- clangd = {},
--   -- gopls = {},
--   -- pyright = {},
--   -- rust_analyzer = {},
--   -- tsserver = {},
--   -- html = { filetypes = { 'html', 'twig', 'hbs'} },
--
--   lua_ls = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
--   },
--   eslint = {
--     settings = {
--       -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
--       workingDirectory = { mode = "auto" },
--     },
--   },
-- }


-- cmp mapping
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
