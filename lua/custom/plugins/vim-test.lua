return {
  'vim-test/vim-test',
  'preservim/vimux',
  config = function()
    vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>', { desc = '[T]est [N]earest' })
    vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>', { desc = '[T]est [F]ile' })
    vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>', { desc = '[T]est [S]uite' })
    vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>', { desc = '[T]est [L]ast' })
    vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>', { desc = '[T]est [V]ist' })
  end,
}
