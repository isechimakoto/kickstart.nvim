return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'astro',
          'bash',
          'c',
          'cpp',
          'css',
          'go',
          'graphql',
          'html',
          'javascript',
          'lua',
          'php',
          'python',
          'rust',
          'scss',
          'svelte',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'vue',
          'yaml',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = '<c-w>',
        --     node_incremental = '<c-w>',
        --     node_decremental = '<c-s>',
        --   },
        -- },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      }
    end,
  },
  { 'nvim-treesitter/playground' },
  { 'nvim-treesitter/nvim-treesitter-context' },
}
