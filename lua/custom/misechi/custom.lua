function QuickFixToggle()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd 'cclose'
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd 'copen'
  end
end

vim.keymap.set('n', '<C-q>', '<cmd>lua QuickFixToggle()<cr>')
vim.keymap.set('n', '<leader>Q', "<cmd>call setqflist([], 'f')<cr>")

function Colors(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)
end

function Dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. Dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

function JqSelectedText()
  -- Get the start and end column positions
  local start_col = vim.fn.col("'<")
  local end_col = vim.fn.col("'>")

  -- Get the line under the cursor
  local line = vim.fn.getline(".")

  -- Get the selected word
  local selected_word = string.sub(line, start_col, end_col)

  local cmd = 'jq ".' .. vim.fn.shellescape(selected_word) .. '" public/messages/message_ja_jpn.json'
  vim.cmd('!' .. cmd)
end

-- Map the function to a key (for example, <leader>j) in visual mode
vim.api.nvim_set_keymap('v', '<leader>z', '<cmd>lua JqSelectedText()<CR>', { noremap = true, silent = true })

