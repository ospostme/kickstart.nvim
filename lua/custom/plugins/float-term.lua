return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set('n', '\\tt', ':FloatermNew<CR>', {})
    vim.keymap.set('t', '\\tt', '<C-\\><C-n>:FloatermNew<CR>', {})
    vim.keymap.set('n', '\\t', ':FloatermToggle<CR>', {})
    vim.keymap.set('t', '\\t', '<C-\\><C-n>:FloatermToggle<CR>', {})
  end,
}
