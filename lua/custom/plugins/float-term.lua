return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set('n', '\\t', ':FloatermNew fff<CR>', {})
    vim.keymap.set('t', '\\t', '<C-\\><C-n>:FloatermNew<CR>', {})
    vim.keymap.set('n', '\\tt', ':FloatermToggle<CR>', {})
    vim.keymap.set('t', '\\tt', '<C-\\><C-n>:FloatermToggle<CR>', {})
  end,
}
