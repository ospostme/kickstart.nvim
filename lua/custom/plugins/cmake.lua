return {
  'cdelledonne/vim-cmake',
  config = function()
    vim.keymap.set('', '<leader>cg', ':CMakeGenerate<cr>', { desc = '[C]Make [G]enerate' })
    vim.keymap.set('', '<leader>cb', ':CMakeBuild<cr>', { desc = '[C]Make [B]uild' })
    vim.keymap.set('', '<leader>ce', ':CMakeClose<cr>', { desc = '[C]Make clos[E]' })
    vim.keymap.set('', '<leader>cc', ':CMakeClean<cr>', { desc = '[C]Make [C]lean' })
    vim.cmd [[let g:cmake_link_compile_commands = 1]]
  end,
}
