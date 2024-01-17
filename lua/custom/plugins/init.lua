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
    config = function ()
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
    opts = { }
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
  {'kevinhwang91/nvim-bqf', ft = 'qf'},
  {'junegunn/fzf', run = function()
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
}
