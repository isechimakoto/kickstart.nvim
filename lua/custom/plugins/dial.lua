return {
  'monaqa/dial.nvim',
  keys = {
    {
      '<C-a>',
      function()
        require('dial.map').manipulate('increment', 'normal')
      end,
      desc = 'Increment',
      mode = { 'n' },
    },
    {
      '<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'normal')
      end,

      desc = 'Decrement',
      mode = { 'n' },
    },
    {
      'g<C-a>',
      function()
        require('dial.map').manipulate('increment', 'gnormal')
      end,
      desc = 'Increment',
      mode = { 'n' },
    },
    {
      'g<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'gnormal')
      end,
      desc = 'Decrement',
      mode = { 'n' },
    },
    {
      '<C-a>',
      function()
        require('dial.map').manipulate('increment', 'visual')
      end,
      desc = 'Increment',
      mode = { 'v' },
    },
    {
      '<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'visual')
      end,
      desc = 'Decrement',
      mode = { 'v' },
    },
    {
      'g<C-a>',
      function()
        require('dial.map').manipulate('increment', 'gvisual')
      end,
      desc = 'Increment',
      mode = { 'v' },
    },
    {
      'g<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'gvisual')
      end,
      desc = 'Decrement',
      mode = { 'v' },
    },
  },
}
