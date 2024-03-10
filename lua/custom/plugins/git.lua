return {
  { 'tpope/vim-fugitive' },

  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup {
        opts = {
          -- adds current line nr in the url for normal mode
          -- add_current_line_on_normal_mode = true,
          -- print the url after performing the action
          print_url = true,
        },
        callbacks = {
          ['github.com'] = function(url_data)
            local url = 'https://github.com/' .. url_data.repo .. '/blob/' .. url_data.rev .. '/' .. url_data.file
            if url_data.lstart then
              url = url .. '#L' .. url_data.lstart
              if url_data.lend then
                url = url .. '-L' .. url_data.lend
              end
            end
            return url
          end,
        },
      }
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
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
}
