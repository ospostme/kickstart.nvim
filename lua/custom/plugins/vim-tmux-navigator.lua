return {
  'christoomey/vim-tmux-navigator', --"navigate seamlessly between vim and tmux
  'preservim/vimux',

  config = function()
    --vim.keymap.set('n', '<C-h>', ':<C-U>TmuxNavigateLeft<cr>', {})
    --vim.keymap.set('n', '<C-k>', ':<C-U>TmuxNavigateDown<cr>', {})
    --vim.keymap.set('n', '<C-j>', ':<C-U>TmuxNavigateUp<cr>', {})
    --vim.keymap.set('n', '<C-l>', ':<C-U>TmuxNavigateRight<cr>', {})
  end,
}
